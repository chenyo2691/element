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
	@echo "   make                                 ---  命令使用说明"
	@echo "   make install                         ---  安装依赖"
	@echo "   make new <component-name> [中文名]   ---  创建新组件 package. 例如 'make new button 按钮'"
	@echo "   make dev                             ---  开发模式"
	@echo "   make dist                            ---  编译项目，生成目标文件"
	@echo "   make deploy                          ---  部署 demo"
	@echo "   make pub                             ---  发布到 npm 上"
	@echo "   make new-lang <lang>                 ---  为网站添加新语言. 例如 'make new-lang fr'"
