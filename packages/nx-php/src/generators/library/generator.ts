import {
  addProjectConfiguration,
  formatFiles,
  getWorkspaceLayout,
  Tree,
} from '@nrwl/devkit';
import { join } from 'path';
import { addFiles, normalizeOptions } from '../../utils';
import { LibraryGeneratorSchema } from './schema';

export default async function (tree: Tree, options: LibraryGeneratorSchema) {
  const normalizedOptions = normalizeOptions(
    tree,
    getWorkspaceLayout(tree).libsDir,
    options
  );
  const sourceRoot = normalizedOptions.projectRoot;

  addProjectConfiguration(tree, normalizedOptions.projectName, {
    root: sourceRoot,
    projectType: 'library',
    sourceRoot,
    targets: {
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
  await formatFiles(tree);
}
