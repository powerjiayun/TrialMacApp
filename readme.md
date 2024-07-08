## 为什么要建这个项目

为了让更多消费者能更加了解某个 APP，我创建了此脚本用来支持诸多 APP 的较长时间试用，因为很多软件只有 7 天、15 天的试用期，不太够充分了解其所有能力。

使用此脚本的所有人，应该在完全了解或充分使用一个 APP 后购买正版使用。

另外多说一句，有些网站，挂着盗版的资源还要卖钱，并且还真的有傻逼花钱用盗版软件。要不找开源或免费替代软件，要不花钱买正版，或者拼车买正版，花了钱还用盗版真的是纯纯脑瘫。

## 注意

```diff
- 只支持 arm 架构 m 系芯片
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

## 常见问题

1.  使用脚本后 app 无法打开

- 执行 `xattr -cr /Applications/xxxx.app` 如果 app 名字有空格就在空格前面加上一个 `\`，例如 `xattr -cr /Applications/Trial\ Mac\ App.app`
- 也可以输入 `xattr -cr ` 然后打开 `Finder` 把对应的 app 拖到终端

## 支持的 app 如下

> 其中的版本，是我测试的版本，理论上任意版本都可以，只要版本差不是太大

> MAS = Mac App Store

| 名称                 | 版本     | MAS | 备注             |
| -------------------- | -------- | --- | ---------------- |
| Macs Fan Control | 1.5.16 | ❌ |  |
| Things3 | 3.19.6 | ❌ |  |
| Xnip | 2.2.3 | ❌ |  |
| Transmit | 5.10.4 | ✅ |  |
| BuhoCleaner | 1.10.4 | ❌ |  |
| Image2Icon | 2.18 | ✅ |  |
| FileZilla Pro | 3.66.5 | ✅ |  |
| menubarx |  | ✅ |  |
| servercat | 1.9.1 | ✅ |  |
| SQLPro Studio | 2023.35 | ✅ |  |
| Texifier | 1.9.27 | ❌ |  |
| Sketch | 100 | ✅ |  |
| Omi录屏专家 | 1.3.8 | ✅ |  |
| CleanShot X | 4.7 | ❌ |  |
| Aldente Pro | 1.26.1 | ❌ |  |
| Table Plus | 6.0.4 | ❌ |  |
| Doppler | 2.1.21 | ❌ |  |
| Text Scanner | 1.7.5 | ✅ |  |
| 欧陆词典 | 4.6.6 | ❌ |  |
| Blocs |  | ❌ |  |
| PlistEdit Pro | 1.9.7 | ❌ |  |
| Downie 4 | 4.7.2 | ❌ |  |
| Typora | 1.8.10 | ❌ |  |
| Stash | 2.6.2 | ❌ |  |
| App Cleaner | 8.2.7 | ❌ |  |
| Hype4 | 4.1.18 | ✅ |  |
| Infuse | 7.8.4860 | ✅ |  |
| Kaleidoscope | 4.5.1 | ❌ |  |
| Pixelmator Pro Trial | 3.5.9 | ❌ |  |
| Proxyman | 5.2.0 | ❌ |  |
| ServerCat | 1.12 | ✅ |  |
| Core Tunnel | 3.8.6 | ✅ |  |
| Navicat Premium | 17.0.6 | ✅ |  |
| Permute 3 | 3.11.10 | ❌ |  |
| Eon | 2.9.12 | ❌ |  |
| UctoX 2 | 2.9.14 | ❌ |  |
| Rottenwood | 1.3 | ❌ |  |
| Judo | 7.0.4 | ❌ | 有几个功能不能用 |
