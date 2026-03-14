#!/bin/bash

# 部署脚本 - 将clean-blog推送到GitHub Pages

echo "=== 开始部署clean-blog到GitHub Pages ==="

# 检查Git是否安装
if ! command -v git &> /dev/null; then
    echo "错误: Git未安装。请先安装Git。"
    exit 1
fi

# 检查是否在clean-blog目录中
if [ ! -f "index.html" ] || [ ! -d "assets" ]; then
    echo "错误: 请在clean-blog目录中运行此脚本。"
    echo "使用: cd clean-blog && ./deploy.sh"
    exit 1
fi

# 检查远程仓库配置
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE_URL" ]; then
    echo "配置远程仓库..."
    read -p "请输入你的GitHub用户名: " GITHUB_USER
    git remote add origin "https://github.com/${GITHUB_USER}/clean-blog.git"
    REMOTE_URL="https://github.com/${GITHUB_USER}/clean-blog.git"
fi

echo "远程仓库: $REMOTE_URL"

# 检查网络连接
echo "检查GitHub连接..."
if ! curl -s --head https://github.com --connect-timeout 5 > /dev/null; then
    echo "警告: 无法连接到GitHub，请检查网络连接。"
    echo "你可以稍后手动运行以下命令:"
    echo "  git push -u origin main"
    exit 1
fi

# 推送代码
echo "推送代码到GitHub..."
if git push -u origin main; then
    echo "✅ 代码推送成功！"
    echo ""
    echo "=== 下一步操作 ==="
    echo "1. 访问 https://github.com/$(echo $REMOTE_URL | cut -d'/' -f4)/clean-blog"
    echo "2. 点击 'Settings' → 'Pages'"
    echo "3. 在 'Source' 部分选择 'Deploy from a branch'"
    echo "4. 在 'Branch' 部分选择 'main' 分支，文件夹选择 '/ (root)'"
    echo "5. 点击 'Save'"
    echo "6. 等待几分钟，然后访问: https://$(echo $REMOTE_URL | cut -d'/' -f4).github.io/clean-blog/"
    echo ""
    echo "🎉 部署完成！你的网站将很快在GitHub Pages上可用。"
else
    echo "❌ 推送失败。可能的原因:"
    echo "   - 仓库不存在: 请确保在GitHub上创建了clean-blog仓库"
    echo "   - 权限不足: 检查是否有推送权限"
    echo "   - 网络问题: 检查网络连接"
    echo ""
    echo "手动创建仓库步骤:"
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名: clean-blog"
    echo "3. 不要初始化README、.gitignore或license"
    echo "4. 点击 'Create repository'"
    echo "5. 然后重新运行此脚本"
fi