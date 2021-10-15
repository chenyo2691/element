const path = require('path');
/**
 * 用于在开发阶段，使用chokidar监听工具，监听官网模板文件的变化，执行npm run i18n，即以上i18n.js的内容。
 * 在开发时使用。
 * 提示：由于模板文件在开发阶段并没有引入，因此需要通过监听的方式，实现热加载。
 */
const templates = path.resolve(process.cwd(), './examples/pages/template');

const chokidar = require('chokidar');
let watcher = chokidar.watch([templates]);

watcher.on('ready', function() {
  watcher
    .on('change', function() {
      exec('npm run i18n');
    });
});

function exec(cmd) {
  return require('child_process').execSync(cmd).toString().trim();
}
