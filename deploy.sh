#!/usr/bin/env bash
set -euo pipefail
# Anatomy Skills CLI脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/wheresryan22/anatomy#install
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

npx -y skills add wheresryan22/anatomy -g
npx -y skills list | grep -qi anatomy && echo 'Anatomy 已安装' || echo '未检测到，重跑安装并选择客户端'

echo ""

echo "部署完成：在客户端里让 Agent 调用 anatomy 技能，描述机器或系统即可生成 SVG"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/wheresryan22/anatomy#install"
