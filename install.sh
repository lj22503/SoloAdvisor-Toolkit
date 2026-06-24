#!/bin/bash

# Investment Advisory Skills 安装脚本
# 用途：将投顾技能库安装到本地，使AI能自动调用

set -e

echo "============================================"
echo "Investment Advisory Skills 安装"
echo "============================================"
echo ""

# 检查是否在 Claude Code 环境中
if [ -z "$CLAUDE_CODE" ] && [ -z "$HOME" ]; then
    echo "警告：建议在 Claude Code 环境中运行"
    echo ""
fi

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${HOME}/.claude/skills/investment-advisory"

echo "安装目录: $TARGET_DIR"
echo ""

# 创建目标目录
echo "创建目录..."
mkdir -p "$(dirname "$TARGET_DIR")"

# 复制文件
echo "复制技能文件..."
if [ -d "$TARGET_DIR" ]; then
    echo "目标目录已存在，是否覆盖？(y/n)"
    read -r confirm
    if [ "$confirm" = "y" ]; then
        rm -rf "$TARGET_DIR"
        cp -r "$SCRIPT_DIR" "$TARGET_DIR"
        echo "已覆盖安装"
    else
        echo "安装取消"
        exit 0
    fi
else
    cp -r "$SCRIPT_DIR" "$TARGET_DIR"
    echo "安装完成"
fi

echo ""

# 验证安装
echo "验证安装..."
if [ -f "$TARGET_DIR/CLAUDE.md" ] && [ -f "$TARGET_DIR/README.md" ]; then
    echo "✅ 安装成功"
    echo ""
    echo "下一步："
    echo "1. 在你的项目目录创建 CLAUDE.md 或 .claude/settings.json"
    echo "2. 添加以下内容引用技能库："
    echo ""
    echo "   [settings]"
    echo "   skills_dir = [\"$TARGET_DIR/skills\"]"
    echo ""
    echo "3. 或直接在你的 CLAUDE.md 中写："
    echo "   使用 investment-advisory-skills 处理投顾任务"
    echo ""
else
    echo "❌ 安装失败，文件不完整"
    exit 1
fi
