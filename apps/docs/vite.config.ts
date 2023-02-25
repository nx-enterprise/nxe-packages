/// <reference types="vitest" />

import analog from '@analogjs/platform';
import { defineConfig } from 'vite';

// https://vitejs.dev/config/
export default defineConfig(() => {
  return {
    publicDir: 'src/assets',
    build: {
      target: ['es2020'],
    },
    plugins: [
      analog({
        ssr: true,
        ssrBuildDir: '../../dist/apps/docs/ssr',
        entryServer: 'apps/docs/src/main.server.ts',
        static: true,
        prerender: {
          routes: async () => {
            return [
              '/',
              '/about',
              '/blog/2022-12-27-my-first-post',
              '/blog/2022-12-31-my-second-post',
            ];
          },
        },
        vite: {
          tsconfig: 'apps/docs/tsconfig.app.json',
        },
        nitro: {
          rootDir: 'apps/docs',
          output: {
            dir: '../../../dist/apps/docs/server',
            publicDir: '../../../dist/apps/docs/server/public',
          },
          publicAssets: [{ dir: `../../../dist/apps/docs/client` }],
          serverAssets: [
            { baseName: 'public', dir: `./dist/apps/docs/client` },
          ],
          buildDir: '../../dist/apps/docs/.nitro',
        },
      }),
    ],
  };
});
