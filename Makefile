.PHONY: dist test
# ִ��makeĬ��ָ��help
default: help

# build all theme
# ��������
build-theme:
	npm run build:theme
# ��װ����
install:
	npm install
# ʹ���Ա�Դ��װ����
install-cn:
	npm install --registry=http://registry.npm.taobao.org
# ����Ӧ��
dev:
	npm run dev

play:
	npm run dev:play
# �������
new:
	node build/bin/new.js $(filter-out $@,$(MAKECMDGOALS))
# Ϊ��վ���������
new-lang:
	node build/bin/new-lang.js $(filter-out $@,$(MAKECMDGOALS))
# ���
dist: install
	npm run dist
# ����
deploy:
	@npm run deploy
# ����
pub:
	npm run pub
# ��Ԫ����
test:
	npm run test:watch
# ������Ϣ
help:
	@echo "   make                                 ---  ����ʹ��˵��"
	@echo "   make install                         ---  ��װ����"
	@echo "   make new <component-name> [������]   ---  ��������� package. ���� 'make new button ��ť'"
	@echo "   make dev                             ---  ����ģʽ"
	@echo "   make dist                            ---  ������Ŀ������Ŀ���ļ�"
	@echo "   make deploy                          ---  ���� demo"
	@echo "   make pub                             ---  ������ npm ��"
	@echo "   make new-lang <lang>                 ---  Ϊ��վ���������. ���� 'make new-lang fr'"
