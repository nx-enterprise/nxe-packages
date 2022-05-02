import {
  addProjectConfiguration,
  formatFiles,
  getWorkspaceLayout,
  Tree,
} from '@nrwl/devkit';
import { join, normalize } from 'path';
import {
  addFiles,
  createGoMod,
  normalizeOptions,
  toPosixPath,
} from '../../utils';
import { ApplicationGeneratorSchema } from './schema';

export default async function (
  tree: Tree,
  options: ApplicationGeneratorSchema
) {
  const normalizedOptions = normalizeOptions(
    tree,
    getWorkspaceLayout(tree).appsDir,
    options
  );
  const sourceRoot = normalizedOptions.projectRoot;

  const targetOptions = {
    outputPath: toPosixPath(join(normalize('dist'), sourceRoot)),
    main: toPosixPath(join(sourceRoot, 'index.php')),
  };

  addProjectConfiguration(tree, normalizedOptions.projectName, {
    root: sourceRoot,
    projectType: 'application',
    sourceRoot,
    targets: {
      build: {
        executor: '@nx-enterprise/nx-php:build',
        options: targetOptions,
      },
      serve: {
        executor: '@nx-enterprise/nx-php:serve',
        options: {
          main: toPosixPath(join(sourceRoot, 'index.php')),
        },
      },
      test: {
        executor: '@nx-enterprise/nx-php:test',
      },
      lint: {
        executor: '@nx-enterprise/nx-php:lint',
      },
    },
    tags: normalizedOptions.parsedTags,
  });
  addFiles(tree, join(__dirname, 'files'), normalizedOptions);
  createGoMod(tree, normalizedOptions);
  await formatFiles(tree);
}
