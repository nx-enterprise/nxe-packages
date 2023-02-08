import { checkFilesExist, ensureNxProject, readJson, runNxCommandAsync, uniq } from '@nrwl/nx-plugin/testing';
describe('nxe-ddd-architecture e2e', () => {
  it('should create nxe-ddd-architecture', async () => {
    const plugin = uniq('nxe-ddd-architecture');
    ensureNxProject('@nx-enterprise/nxe-ddd-architecture', 'dist/packages/nxe-ddd-architecture');
    await runNxCommandAsync(`generate @nx-enterprise/nxe-ddd-architecture:nxe-ddd-architecture ${plugin}`);

    const result = await runNxCommandAsync(`build ${plugin}`);
    expect(result.stdout).toContain('Executor ran');
  }, 120000);

  describe('--directory', () => {
    it('should create src in the specified directory', async () => {
      const plugin = uniq('nxe-ddd-architecture');
      ensureNxProject('@nx-enterprise/nxe-ddd-architecture', 'dist/packages/nxe-ddd-architecture');
      await runNxCommandAsync(
        `generate @nx-enterprise/nxe-ddd-architecture:nxe-ddd-architecture ${plugin} --directory subdir`,
      );
      expect(() => checkFilesExist(`libs/subdir/${plugin}/src/index.ts`)).not.toThrow();
    }, 120000);
  });

  describe('--tags', () => {
    it('should add tags to the project', async () => {
      const plugin = uniq('nxe-ddd-architecture');
      ensureNxProject('@nx-enterprise/nxe-ddd-architecture', 'dist/packages/nxe-ddd-architecture');
      await runNxCommandAsync(
        `generate @nx-enterprise/nxe-ddd-architecture:nxe-ddd-architecture ${plugin} --tags e2etag,e2ePackage`,
      );
      const project = readJson(`libs/${plugin}/project.json`);
      expect(project.tags).toEqual(['e2etag', 'e2ePackage']);
    }, 120000);
  });
});
