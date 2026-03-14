# GitHub Pages 部署指南

## 当前状态
- 仓库地址: `https://github.com/darkshallow-113/clean-blog`
- 分支: `main`
- 最新提交: 已包含所有博客文件

## 部署步骤

### 1. 推送代码到 GitHub
```bash
cd clean-blog
git push origin main
```

### 2. 在 GitHub 上启用 GitHub Pages

1. 访问你的仓库: `https://github.com/darkshallow-113/clean-blog`
2. 点击 "Settings" 选项卡
3. 在左侧菜单中找到 "Pages"
4. 在 "Source" 部分:
   - 选择 "Deploy from a branch"
   - 分支选择 "main"
   - 文件夹选择 "/ (root)"（根目录）
5. 点击 "Save"

### 3. 等待部署完成
- GitHub Pages 通常需要 1-2 分钟来构建和部署
- 部署完成后，你会看到一个绿色的提示，显示你的网站 URL
- 默认 URL: `https://darkshallow-113.github.io/clean-blog/`

### 4. 访问你的网站
- 打开浏览器访问: `https://darkshallow-113.github.io/clean-blog/`
- 或者: `https://darkshallow-113.github.io/clean-blog/index.html`

## 文件结构
```
clean-blog/
├── index.html          # 主页面
├── assets/             # 样式和图片
│   └── style.css
├── test-local.html     # 测试页面
├── deploy.sh          # 原始部署脚本
├── deploy-vercel.sh   # Vercel 部署脚本
├── vercel.json        # Vercel 配置
└── .gitignore         # Git 忽略规则
```

## 注意事项

### 1. 自定义域名（可选）
如果你想使用自定义域名:
1. 在仓库 Settings → Pages → Custom domain
2. 输入你的域名
3. 按照提示配置 DNS 记录

### 2. 强制 HTTPS（推荐）
在 Pages 设置中启用 "Enforce HTTPS" 选项

### 3. 自动部署
每次推送到 `main` 分支时，GitHub Pages 会自动重新部署

### 4. 故障排除
如果网站没有显示:
1. 检查 Pages 设置中的分支和文件夹配置
2. 确保 `index.html` 在根目录
3. 查看 Actions 选项卡中的部署日志
4. 等待几分钟后刷新页面

## 替代部署方案

### Vercel 部署（已准备）
如果你遇到 GitHub Pages 访问问题，可以使用 Vercel:
1. 访问 https://vercel.com/
2. 拖拽 `deploy-package/` 文件夹或 `clean-blog-deploy.tar.gz` 文件
3. 按照提示完成部署

### 本地测试
```bash
cd clean-blog
python3 -m http.server 8000
# 然后在浏览器访问 http://localhost:8000
```

## 技术支持
如果遇到问题，请检查:
1. GitHub Pages 文档: https://docs.github.com/pages
2. 仓库的 Actions 日志
3. 浏览器开发者工具控制台错误