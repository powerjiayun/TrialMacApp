<img src="./TrialMacAppGUI/Assets.xcassets/AppIcon.appiconset/icon_1024X1024 1.png" width="160" alt="App icon" align="left"/>

<div>
<h3>TrialMacAppGUI</h3>
<p>更改软件逻辑，以达到延长许多应用程序试用时间的目的</p>
<a href="https://github.com/TrialMacApp/TrialMacApp/releases/latest">Download for macOS</a>
</div>

<br/>
<br/>

<div align="center">

![](https://img.shields.io/github/downloads/TrialMacApp/TrialMacApp/total.svg?style=flat)
![](https://img.shields.io/github/release-pre/TrialMacApp/TrialMacApp.svg?style=flat)
![](https://img.shields.io/badge/platform-macOS-blue.svg?style=flat)
![](https://img.shields.io/github/license/TrialMacApp/TrialMacApp)
![](https://img.shields.io/github/stars/TrialMacApp/TrialMacApp)
![](https://img.shields.io/github/forks/TrialMacApp/TrialMacApp)

<br/>
<br/>

<a href="readme.md">English</a> | <a href="readme_zh-Hans.md">简体中文</a>

</div>

<hr>

## 支持的 app

<a href="app.md">点我查看</a>

## 特点

- Swift 原生应用
- SwiftUI 编写交互界面 拒绝 Appkit
- 密码使用钥匙串加密
- 原生代码编写注入插件
- **代码开源且免费**

### 演示视频

https://github.com/user-attachments/assets/5c7e4ae3-f8b4-45db-be5d-094ebabb2a42

### macOS compatibility

macOS 13 or newer

## 如何编译

### Required

- Xcode

### Build steps

- Clone the project via this Terminal command:

```sh
git clone git@github.com:TrialMacApp/TrialMacApp.git
```

### Third party dependencies

- [Sparkle](https://github.com/sparkle-project/Sparkle)

## FAQ

> Q: 执行注入后软件无法安装 helper
>
> A: 我还没有对 helper 做处理，先在未注入状态下安装 helper，然后再注入

> Q: 点击执行注入后没有任何反应
>
> A: 设置 -> 隐私 -> APP管理  允许TrialMacAppGUI

> Q: 界面上的图标都是什么意思？
>
> A: 右键图标可以选择展示模式
> ![](images/1.png)

> Q: 支持APP的窗口，备注看不全
>
> A: 可以自行拖动加宽备注这一列的宽度，下图的竖线按住往右边拖动。姓名和备注支持右键复制
> ![](images/2.png)
> ![](images/3.png)

> Q: 快速筛选电脑上所有支持注入的APP
>
> A: ![](images/4.png)


## 感谢以下项目

- chatgpt - [chatgpt](https://chatgpt.com)
- jmpews - [Dobby](https://github.com/jmpews/Dobby)
- QiuChenlyOpenSource - [SearchHexCodeInFile](https://github.com/QiuChenlyOpenSource/SearchHexCodeInFile)
- alexzielenski - [optool](https://github.com/alexzielenski/optool)
