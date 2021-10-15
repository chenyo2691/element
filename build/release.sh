#!/usr/bin/env sh
# 合并 dev 分支到 master
# 修改样式包和组件库的版本号
# 发布样式包和组件库
# 提交 master 和 dev 分支到远程仓库
set -e

# 分支切换
git checkout master
git merge dev

# cli，选择版本信息
VERSION=`npx select-version-cli`

# 版本确认
read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Releasing $VERSION ..."

  # build
  VERSION=$VERSION npm run dist

  # ssr test
  node test/ssr/require.test.js

  # publish theme
  echo "Releasing theme-chalk $VERSION ..."
  cd packages/theme-chalk
  npm version $VERSION --message "[release] $VERSION"
  if [[ $VERSION =~ "beta" ]]
  then
    npm publish --tag beta
  else
    npm publish
  fi
  cd ../..

  # commit
  git add -A
  git commit -m "[build] $VERSION"
  # 设置组件库的版本信息
  npm version $VERSION --message "[release] $VERSION"

  # publish
  git push eleme master
  git push eleme refs/tags/v$VERSION
  git checkout dev
  git rebase master
  git push eleme dev

  if [[ $VERSION =~ "beta" ]]
  then
    npm publish --tag beta
  else
    npm publish
  fi
fi
