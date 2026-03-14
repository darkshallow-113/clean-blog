# 个人博客 - 重新部署版本

这是一个包含完整美术效果的静态博客网站，专为GitHub Pages部署设计。

## 功能特性

- 🎨 **6张背景图片自动轮播** - 每5秒切换一张背景
- ❄️ **雪花飘落动画效果** - 35个随机雪花（移动端20个）
- 📜 **卷轴样式内容区域** - 仿古卷轴设计，带边框装饰
- 🌓 **亮/暗主题切换** - 支持系统偏好和手动切换
- 📱 **响应式设计** - 适配手机、平板和桌面设备
- ⚡ **纯静态部署** - 无需服务器，直接部署到GitHub Pages

## 文件结构

```
clean-blog/
├── index.html          # 主页面
├── assets/             # 资源文件
│   ├── style.css      # 样式文件
│   └── *.jpg/.avif/.webp # 背景图片
├── .gitignore         # Git忽略文件
└── README.md          # 说明文档
```

## 部署到GitHub Pages

### 步骤1：创建GitHub仓库

1. 登录GitHub，点击右上角"+" → "New repository"
2. 仓库名：`clean-blog`（或其他名称）
3. 描述：可选
4. 选择"Public"
5. **不要**初始化README、.gitignore或license
6. 点击"Create repository"

### 步骤2：推送代码到GitHub

```bash
# 进入项目目录
cd clean-blog

# 添加远程仓库（将USERNAME替换为你的GitHub用户名）
git remote add origin https://github.com/USERNAME/clean-blog.git

# 推送代码
git push -u origin main
```

### 步骤3：启用GitHub Pages

1. 进入仓库页面：`https://github.com/USERNAME/clean-blog`
2. 点击"Settings" → "Pages"
3. 在"Source"部分，选择"Deploy from a branch"
4. 在"Branch"部分，选择"main"分支，文件夹选择"/ (root)"
5. 点击"Save"
6. 等待几分钟，访问 `https://USERNAME.github.io/clean-blog/`

## 本地测试

1. 直接在浏览器中打开 `index.html`
2. 或使用Python简单HTTP服务器：
   ```bash
   python3 -m http.server 8000
   ```
   然后访问 `http://localhost:8000`

## 美术效果说明

### 背景轮播
- 6张高质量背景图片
- 每5秒自动切换
- 淡入淡出过渡效果
- 深色叠加层确保文字可读性

### 雪花效果
- 使用CSS动画实现
- 随机大小、位置和下落速度
- 移动端减少雪花数量以提升性能

### 卷轴样式
- 主要内容区域使用卷轴设计
- 渐变背景和边框装饰
- 诗歌区域特殊样式
- 卡片悬停效果

### 主题切换
- 支持亮色/暗色主题
- 自动检测系统偏好
- 本地存储用户选择
- 平滑过渡效果

## 故障排除

### 空白页面
- 检查浏览器控制台是否有JavaScript错误
- 确保所有资源文件路径正确
- 确认CSS和JavaScript已正确加载

### 图片不显示
- 检查图片文件是否存在于assets目录
- 确认图片路径在HTML中正确
- 确保图片格式支持（jpg、avif、webp）

### GitHub Pages部署失败
- 检查仓库设置中的Pages配置
- 确认代码已推送到main分支
- 查看GitHub Actions日志（如果有）

## 自定义

### 更换背景图片
1. 将新图片放入`assets/`目录
2. 在`index.html`中更新背景图片路径
3. 确保图片尺寸合适（建议1920×1080或类似比例）

### 修改样式
- 编辑`assets/style.css`文件
- 主要颜色变量在`:root`和`[data-theme="dark"]`中定义
- 动画参数在`@keyframes`中定义

### 添加内容
- 在`index.html`的`<main class="content">`部分添加新内容
- 使用现有的CSS类保持样式一致

## 许可证

本项目仅供个人使用，图片资源来自网络，仅供演示用途。

## 联系

如有问题，请通过GitHub Issues反馈。# clean-blog
