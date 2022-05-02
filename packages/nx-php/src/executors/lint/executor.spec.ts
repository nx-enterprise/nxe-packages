import executor from './executor';
import { LintExecutorSchema } from './schema';

jest.mock('../../utils');
import * as utils from '../../utils';

const options: LintExecutorSchema = {};

describe('Lint Executor', () => {
  beforeEach(async () => {
    // Mocks the runPhpCommand
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (utils as any).runPhpCommand = jest.fn().mockReturnValue({
      success: true,
    });
  });

  afterEach(() => jest.clearAllMocks());

  it('can run', async () => {
    const output = await executor(options, null);
    expect(output.success).toBe(true);
  });
});
