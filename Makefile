.PHONY: dist test
# 执行make默认指向help
default: help

# build all theme
# 构建主题
build-theme:
	npm run build:theme
# 安装依赖
install:
	npm install
# 使用淘宝源安装依赖
install-cn:
	npm install --registry=http://registry.npm.taobao.org
# 构建应用
dev:
	npm run dev

play:
	npm run dev:play
# 新增组件
new:
	node build/bin/new.js $(filter-out $@,$(MAKECMDGOALS))
# 为网站添加新语言
new-lang:
	node build/bin/new-lang.js $(filter-out $@,$(MAKECMDGOALS))
# 打包
dist: install
	npm run dist
# 部署
deploy:
	@npm run deploy
# 发布
pub:
	npm run pub
# 单元测试
test:
	npm run test:watch
# 帮助信息
help:
	@echo "   make help"
	@echo "   make install                         ---  install dependence"
	@echo "   make new <component-name> [cnName]   ---  make new component package. eg 'make new button btns'"
	@echo "   make dev                             ---  development mode"
	@echo "   make dist                            ---  compile project, build target files"
	@echo "   make deploy                          ---  deploy demo"
	@echo "   make pub                             ---  publish to npm"
	@echo "   make new-lang <lang>                 ---  new language for website. eg. 'make new-lang fr'"
