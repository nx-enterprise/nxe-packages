import { defineConfig } from 'vite';
import analog from '@analogjs/platform';
import tsconfigPathsPlugin from 'vite-tsconfig-paths';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  publicDir: 'src/assets',
  build: {
    target: ['es2020'],
  },
  resolve: {
    mainFields: ['module'],
  },
  plugins: [
    analog({
      vite: {
        tsconfig: 'apps/docs/tsconfig.app.json',
      },
      nitro: {
        rootDir: 'apps/docs',
      },
    }),
    tsconfigPathsPlugin({
      root: '../../',
    }),
  ],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['src/test.ts'],
    include: ['**/*.spec.ts'],
  },
  define: {
    'import.meta.vitest': mode !== 'production',
  },
}));
