## 项目简介

使用 [Dobby](https://github.com/jmpews/Dobby) 制作的 macOS 环境动态注入库，用来更改部分软件的试用逻辑。

## 为什么要建这个项目

为了让更多消费者能更加了解某个 APP，我创建了此脚本用来支持诸多 APP 的较长时间试用，因为很多软件只有 7 天、15 天的试用期，不太够充分了解其所有能力。

使用此脚本的所有人，应该在完全了解或充分使用一个 APP 后购买正版使用。

另外多说一句，有些网站，挂着盗版的资源还要卖钱，并且还真的有xx花钱用盗版软件。要不找开源或免费替代软件，要不花钱买正版，或者拼车买正版。

## 注意

```diff
- 只支持 arm 架构 m 系芯片
- Intel 用户可以直接关掉网页，未来也不支持 Intel 架构

+ 这是完全免费的 不用花一毛钱

+ app有helper的先装helper，我还没有对helper做同一处理，例如stash、Macs Fan Control 等软件

+ 我的试用也不一定很全面，有问题有bug就提issue
```

## 如何使用

1.  [点我下载](https://github.com/TrialMacApp/TrialMacApp/archive/refs/heads/master.zip) 然后解压
2.  打开电脑自带的 `终端`
3.  在窗口中输入 `cd ` 注意 cd 两个字母后有一个空格
4.  打开 `Finder` 把上面解压出来的 **文件夹** ，拖动到 `终端` 里，然后按下回车键
5.  输入 `./TrialMacApp` 回车，开始使用

## 感谢以下项目

- jmpews - [Dobby](https://github.com/jmpews/Dobby)
- QiuChenlyOpenSource - [SearchHexCodeInFile](https://github.com/QiuChenlyOpenSource/SearchHexCodeInFile)
- alexzielenski - [optool](https://github.com/alexzielenski/optool)
- tyilo - [insert_dylib](https://github.com/tyilo/insert_dylib)
- QiuChenly - [InjectLib](https://github.com/QiuChenly/InjectLib) 

## 常见问题

1.  

## 支持的 app 如下

> MAS = Mac App Store （代表是否从MAS下载的）

| 名称                 | 版本     | MAS | 备注             |
| -------------------- | -------- | --- | ---------------- |
| Macs Fan Control | 1.5.16 |  |  |
| Things3 | all |  |  |
| Xnip | all | ✅ |  |
| Transmit | all | ✅ |  |
| BuhoCleaner | all |  |  |
| Image2Icon | 2.18 | ✅ |  |
| FileZilla Pro | 3.66.5 | ✅ |  |
| menubarx | all | ✅ |  |
| SQLPro Studio | all | ✅ |  |
| Texifier | 1.9.27 |  |  |
| Sketch | all | ✅ |  |
| Omi录屏专家 | all | ✅ |  |
| CleanShot X | 4.7 |  | 暂停支持 |
| Aldente Pro | 1.26.1 |  | 暂停支持 |
| Table Plus | 6.0.4 |  | 暂停支持 |
| Doppler | all |  |  |
| Text Scanner | 1.7.5 | ✅ | 终端执行其二进制文件 |
| 欧陆词典 | all |  |  |
| Blocs | all |  |  |
| PlistEdit Pro | all |  |  |
| Downie 4 | all |  |  |
| Typora | all |  |  |
| Stash | 2.6.2 |  |  |
| App Cleaner | 8.2.7 |  |  |
| Hype4 | all | ✅ |  |
| Infuse | all | ✅ |  |
| Kaleidoscope | all |  |  |
| Pixelmator Pro Trial | all |  |  |
| Proxyman | 5.2.0 |  |  |
| ServerCat | 1.12 | ✅ |  |
| Core Tunnel | all | ✅ |  |
| Navicat Premium | all | ✅ | 借鉴 Qiuchenly |
| Permute 3 | all |  |  |
| Eon | all |  |  |
| UctoX 2 | all |  |  |
| Rottenwood | all |  |  |
| Judo | all | ✅ | 免登录 有几个功能不能用 |
| Querious | all |  |  |
| ForkLift | all |  |  |
