import { ExecutorContext } from '@nrwl/devkit';
import { runPhpCommand } from '../../../../nx-go/packages/nx-go/src/utils';
import { BuildExecutorSchema } from './schema';

export default async function runExecutor(
  options: BuildExecutorSchema,
  context: ExecutorContext
) {
  const mainFile = `${options.main}`;
  const output = `-o ${options.outputPath}${
    process.platform === 'win32' ? '.exe' : ''
  }`;

  return runPhpCommand(context, 'build', [output, mainFile]);
}
