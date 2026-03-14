#!/bin/bash

# 部署脚本 - 准备Vercel部署

echo "=== 准备部署到Vercel (使用tar压缩) ==="

# 检查是否在clean-blog目录中
if [ ! -f "index.html" ] || [ ! -d "assets" ]; then
    echo "错误: 请在clean-blog目录中运行此脚本。"
    echo "使用: cd clean-blog && ./deploy-vercel.sh"
    exit 1
fi

# 创建部署包
echo "创建部署包..."
DEPLOY_DIR="deploy-package"
rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"

# 复制所有必要文件
cp -r index.html assets/ vercel.json "$DEPLOY_DIR"/
if [ -f "test-local.html" ]; then
    cp test-local.html "$DEPLOY_DIR"/
fi

# 创建压缩包
echo "创建压缩包..."
cd "$DEPLOY_DIR"
tar -czf ../clean-blog-deploy.tar.gz . > /dev/null
cd ..

echo ""
echo "✅ 部署包准备完成！"
echo ""
echo "=== 部署步骤 ==="
echo "1. 访问 https://vercel.com/"
echo "2. 点击 'Add New...' → 'Project'"
echo "3. 选择 'Import Git Repository' 或 'Drag & Drop'"
echo "4. 如果使用拖放方式:"
echo "   - 将 'clean-blog-deploy.tar.gz' 文件拖到页面上"
echo "   - 或者将整个 'deploy-package' 文件夹拖到页面上"
echo "5. 配置项目设置:"
echo "   - 项目名称: clean-blog"
echo "   - 构建命令: (留空，Vercel会自动检测)"
echo "   - 输出目录: ."
echo "6. 点击 'Deploy'"
echo ""
echo "=== 替代方案: 使用Vercel CLI ==="
echo "1. 安装Vercel CLI: npm i -g vercel"
echo "2. 登录: vercel login"
echo "3. 部署: vercel --prod"
echo ""
echo "部署完成后，你会获得一个类似 https://clean-blog.vercel.app 的URL"
echo ""
echo "当前目录已创建:"
echo "  - deploy-package/ - 部署文件"
echo "  - clean-blog-deploy.tar.gz - 压缩包"