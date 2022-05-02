import { ExecutorContext } from '@nrwl/devkit';
import { runPhpCommand } from '../../utils';
import { LintExecutorSchema } from './schema';

export default async function runExecutor(
  options: LintExecutorSchema,
  context: ExecutorContext
) {
  const projectName = context?.projectName;
  const sourceRoot = context?.workspace?.projects[projectName]?.root;
  const cwd = `${sourceRoot}`;
  const sources = `./...`;

  return runPhpCommand(context, 'fmt', [sources], { cwd }); // should replace this with @prettier/plugin-php
}
