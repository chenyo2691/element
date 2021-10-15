'use strict';
/**
 * 用于自动生成官网icon组件全部icon内容的JSON文件的脚本
 * 在开发、编译、发布的前置都会使用
 * 提示：原理是读取packages/theme-chalk/src/icon.scss文件，通过postcss获取样式中全部的样式节点，并通过正则表达式提取icon内容，最终输出目标文件。
 */
var postcss = require('postcss');
var fs = require('fs');
var path = require('path');
var fontFile = fs.readFileSync(path.resolve(__dirname, '../../packages/theme-chalk/src/icon.scss'), 'utf8');
var nodes = postcss.parse(fontFile).nodes;
var classList = [];

nodes.forEach((node) => {
  var selector = node.selector || '';
  var reg = new RegExp(/\.el-icon-([^:]+):before/);
  var arr = selector.match(reg);

  if (arr && arr[1]) {
    classList.push(arr[1]);
  }
});

classList.reverse(); // 希望按 css 文件顺序倒序排列

fs.writeFile(path.resolve(__dirname, '../../examples/icon.json'), JSON.stringify(classList), () => {});
