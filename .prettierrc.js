// pp = prettier plugins
const ppTailwindcss = require('prettier-plugin-tailwindcss');
const ppCssOrder = require('prettier-plugin-css-order');
const ppStyleOrder = require('prettier-plugin-style-order');
const ppJsdoc = require('prettier-plugin-jsdoc');
const ppOrganizeAttributes = require('prettier-plugin-organize-attributes');
const ppPkgJson = require('prettier-plugin-packagejson');
const ppSortJson = require('prettier-plugin-sort-json');
const ppPkg = require('prettier-plugin-pkg');
const ppSh = require('prettier-plugin-sh');
const ppSortImports = require('@trivago/prettier-plugin-sort-imports');

const PRETTIER_PLUGINS = [
  ppTailwindcss,
  ppSh,
  ppCssOrder,
  ppStyleOrder,
  ppJsdoc,
  ppOrganizeAttributes,
  ppPkg,
  ppPkgJson,
  ppSortJson,
  //ppSortImports
];

module.exports = {
  jsdocDescriptionWithDot: true,
  tsdoc: true,
  jsdocDescriptionTag: true,
  jsdocVerticalAlignment: true,
  jsdocSingleLineComment: false,
  jsdocSeparateReturnsFromParam: true,
  jsdocSpaces: 1,
  trailingComma: 'all',
  printWidth: 120,
  tabWidth: 2,
  singleQuote: true,
  plugins: [...PRETTIER_PLUGINS],
  tailwindConfig: './workspace.tailwind.js',
  //attributeGroups: ['$ANGULAR_OUTPUT', '$ANGULAR_TWO_WAY_BINDING', '$ANGULAR_INPUT', '$ANGULAR_STRUCTURAL_DIRECTIVE'],
  attributeGroups: ['^class$', '^(id|name)$', '$DEFAULT', '^aria-'],
  jsonRecursiveSort: true,
  keepOverrides: false,
  order: 'concentric-css',
  //decoratorsBeforeExport: true,
  //importOrderParserPlugins: ['classProperties', 'decorators'],
  // semi: true,
  // importOrder: ["^@core/(.*)$", "^@server/(.*)$", "^@ui/(.*)$", "^[./]"],
  // importOrderSeparation: true,
  // importOrderSortSpecifiers: true
};
