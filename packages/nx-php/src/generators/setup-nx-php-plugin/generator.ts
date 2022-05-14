import {
  formatFiles,
  readWorkspaceConfiguration,
  Tree,
  updateWorkspaceConfiguration,
} from '@nrwl/devkit';

export default async function (tree: Tree) {
  const workspaceConfig = readWorkspaceConfiguration(tree);
  if (workspaceConfig.plugins?.includes('@nx-enterprise/nx-php')) {
    return;
  }
  if (workspaceConfig.plugins) {
    workspaceConfig.plugins.push('@nx-enterprise/nx-php');
  } else {
    workspaceConfig.plugins = ['@nx-enterprise/nx-php'];
  }
  updateWorkspaceConfiguration(tree, workspaceConfig);
  await formatFiles(tree);
}
