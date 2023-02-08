import { checkFilesExist, ensureNxProject, readJson, runNxCommandAsync, uniq } from '@nrwl/nx-plugin/testing';
describe('nxe-php e2e', () => {
  it('should create nxe-php', async () => {
    const plugin = uniq('nxe-php');
    ensureNxProject('@nx-enterprise/nxe-php', 'dist/packages/nxe-php');
    await runNxCommandAsync(`generate @nx-enterprise/nxe-php:nxe-php ${plugin}`);

    const result = await runNxCommandAsync(`build ${plugin}`);
    expect(result.stdout).toContain('Executor ran');
  }, 120000);

  describe('--directory', () => {
    it('should create src in the specified directory', async () => {
      const plugin = uniq('nxe-php');
      ensureNxProject('@nx-enterprise/nxe-php', 'dist/packages/nxe-php');
      await runNxCommandAsync(`generate @nx-enterprise/nxe-php:nxe-php ${plugin} --directory subdir`);
      expect(() => checkFilesExist(`libs/subdir/${plugin}/src/index.ts`)).not.toThrow();
    }, 120000);
  });

  describe('--tags', () => {
    it('should add tags to the project', async () => {
      const plugin = uniq('nxe-php');
      ensureNxProject('@nx-enterprise/nxe-php', 'dist/packages/nxe-php');
      await runNxCommandAsync(`generate @nx-enterprise/nxe-php:nxe-php ${plugin} --tags e2etag,e2ePackage`);
      const project = readJson(`libs/${plugin}/project.json`);
      expect(project.tags).toEqual(['e2etag', 'e2ePackage']);
    }, 120000);
  });
});
