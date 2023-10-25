#!/usr/bin/env sh

checkoutBranch() {
  module=$1
  branch=$2

  # 进入子模块目录
  if [ -n "$module" ]; then
    cd "$module" || return
  fi

  # 检查本地分支是否存在
  if git rev-parse --verify --quiet "$branch"; then
    # 本地分支已经存在，直接切换
    git checkout "$branch"
  else
    # 本地分支不存在，切换到远程分支并创建本地分支
    git checkout -b "$branch" origin/"$branch"
  fi

  # 返回主项目目录
  if [ -n "$module" ]; then
    cd .. || return
  fi
}

createBranch() {
  module=$1
  branch=$2

  # 进入子模块目录
  if [ -n "$module" ]; then
    cd "$module" || return
  fi

  # 创建分支
  git checkout -b "$branch"

  # 推送分支
  git push origin "$branch"

  # 返回主项目目录
  if [ -n "$module" ]; then
    cd .. || return
  fi
}


branch=$1

# 切换主项目分支
createBranch "" "$branch"

# 切换子模块分支
createBranch "mysubmodule1" "$branch"
createBranch "mysubmodule2" "$branch"
createBranch "mysubmodule3" "$branch"