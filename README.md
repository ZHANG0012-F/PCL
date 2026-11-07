# PCL2 安装程序
PCL2 — Minecraft 第三方启动器 一体化 Windows 安装包

## 📦 功能说明
1. 自动安装启动器至 `C:\Program Files\PCL2`
2. 自动创建开始菜单快捷方式、桌面快捷方式

4. 卸载特性
- 自动关闭正在运行的 PCL2 进程
- 自动清理缓存目录：`%localappdata%\PCL2`、`%userprofile%\.pcl2`

## 🛠 编译环境要求
- 软件：Inno Setup 6
- 脚本文件：`setup.iss`
- 依赖文件（放置于 D:\sign 目录）
  - miaoda-code.TXT（许可协议首页）
  - miaoda-code (1).TXT
  - miaoda-code (2).TXT
  - ChineseSimplified.isl（中文语言包，可选）
  - codecpacks_key.cer（公钥证书）
  - 启动主程序 `Plain Craft Launcher 2.exe`

## 🚀 编译方式
### 方式1：一键编译脚本 build.bat
运行 `build.bat`，自动调用 ISCC 编译。
> 默认：**不执行数字签名**，如需签名自行启用脚本内签名代码，并准备 `.pfx` 私钥证书。

### 方式2：IDE手动编译
使用 Inno Setup 软件打开 `setup.iss` → 运行编译。

## 📄 安装包基础信息
- 项目名称：PCL2
- 版本号：2.13.0.1
- 开发商：成都瓜皮龙科技有限公司
- 官网：https://pcl.ruanmao.net/
- Github：https://github.com/Meloong-Git/PCL
- 输出路径：`C:\Users\f1899\Downloads\PCL2_Setup_2.13.0.1.exe`

## 📝 setup.iss 关键配置须知
1. `PrivilegesRequired=admin`
必须启用！导入本机计算机级证书需要管理员权限
2. 证书导入逻辑：PowerShell 静默导入，失败自动忽略不阻断安装
3. 压缩模式：SolidCompression 极致压缩，减小安装包体积
4. 语言：默认 `compiler:Default.isl`（英文向导）；
需要中文向导，请启用外部 `ChineseSimplified.isl`

## ❌ 常见故障排查
1. 证书导入无效
- 确认安装包【右键 → 以管理员身份运行】
2. 编译提示语言文件缺失
- 注释 `[Languages]` 区块，使用英文界面
3. 文件找不到
- 确认所有资源路径与脚本内配置保持一致

## 📜 协议说明
PCL2 遵循开源协议，本安装程序仅作为打包分发工具，不修改启动器本体代码。
