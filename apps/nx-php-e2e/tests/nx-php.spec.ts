import {
  checkFilesExist,
  ensureNxProject,
  readJson,
  runNxCommandAsync,
  uniq,
} from '@nrwl/nx-plugin/testing';
describe('nx-php e2e', () => {
  it('should create nx-php', async () => {
    const plugin = uniq('nx-php');
    ensureNxProject('@nx-enterprise/nx-php', 'dist/packages/nx-php');
    await runNxCommandAsync(`generate @nx-enterprise/nx-php:nx-php ${plugin}`);

    const result = await runNxCommandAsync(`build ${plugin}`);
    expect(result.stdout).toContain('Executor ran');
  }, 120000);

  describe('--directory', () => {
    it('should create src in the specified directory', async () => {
      const plugin = uniq('nx-php');
      ensureNxProject('@nx-enterprise/nx-php', 'dist/packages/nx-php');
      await runNxCommandAsync(
        `generate @nx-enterprise/nx-php:nx-php ${plugin} --directory subdir`
      );
      expect(() =>
        checkFilesExist(`libs/subdir/${plugin}/src/index.ts`)
      ).not.toThrow();
    }, 120000);
  });

  describe('--tags', () => {
    it('should add tags to the project', async () => {
      const plugin = uniq('nx-php');
      ensureNxProject('@nx-enterprise/nx-php', 'dist/packages/nx-php');
      await runNxCommandAsync(
        `generate @nx-enterprise/nx-php:nx-php ${plugin} --tags e2etag,e2ePackage`
      );
      const project = readJson(`libs/${plugin}/project.json`);
      expect(project.tags).toEqual(['e2etag', 'e2ePackage']);
    }, 120000);
  });
});
