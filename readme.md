<img src="./TrialMacAppGUI/Assets.xcassets/AppIcon.appiconset/icon_1024X1024 1.png" width="160" alt="App icon" align="left"/>

<div>
<h3>TrialMacAppGUI</h3>
<p>Change the software logic to achieve the purpose of extending the trial time of many apps</p>
<a href="https://github.com/TrialMacApp/TrialMacApp/releases">Download for macOS</a>
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

## Supported Apps

<a href="app.md">Click me to view</a>

## Major features

- Swift native application
- SwiftUI writes interactive interface and rejects Appkit
- Passwords are encrypted using keychains
- Native code writing injection plug-ins
- **The code is open source and free**

### Demo video

https://github.com/user-attachments/assets/5c7e4ae3-f8b4-45db-be5d-094ebabb2a42

### macOS compatibility

macOS 13 or newer

## How to build

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

> Q: After executing the injection, the software cannot install the helper
>
> A: I haven't processed the helper yet. I first install the helper in the uninjected state and then inject it

> Q: Nothing happens after clicking the injection
>
> A: Settings -> Privacy -> APP Management Allow TrialMacAppGUI

> Q: What do the icons on the interface mean?
>
> A: Right-click the icon to select the display mode
> ![](images/1.png)

> Q: The window that supports APPs cannot see all the remarks
>
> A: You can drag and widen the width of the remark column. Press and hold the vertical line in the figure below and drag it to the right. The name and remark can be copied by right-clicking
> ![](images/2.png)
> ![](images/3.png)

> Q: Quickly filter all APPs on the computer that support injection
>
> A: ![](images/4.png)


## Acknowledgements

- chatgpt - [chatgpt](https://chatgpt.com)
- jmpews - [Dobby](https://github.com/jmpews/Dobby)
- QiuChenlyOpenSource - [SearchHexCodeInFile](https://github.com/QiuChenlyOpenSource/SearchHexCodeInFile)
- alexzielenski - [optool](https://github.com/alexzielenski/optool)
