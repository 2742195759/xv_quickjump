# xv_quickjump
xv_quickjump 是 leap.nvim 的 vim 实现版本。支持 vim8.2+ 以上的版本(主要是依赖 popup_windows)， xk_quickjump 支持如下的跳转方式：

- 在基本模式下，按下`s`就可以开启jump模式，再按下当前buffer的头一个字母，就可以跳跃过去。

- 在全局模式下，支持windows的切换：按下`S`就可以开启jump模式，在按下当前屏幕上的2个字母，就可以实现跳跃。

- Windows 模式下，按下 `<tab>` 就可以开启 windows 的跳转模式，所有的 windows 都会出现一个label，按下label就可以跳转到指定的窗口。

通过上述三个模式，可以极大的提高跳转效率。同时实现的 quickjump 跳转支持 omap，可以配合常见的 operator 使用，比如 `d` + `s`。

如果label不够，那么可以按下 `<space>` 键来进行切换下一轮的，这样用户只需要盯着跳转位置即可，如果没有高亮，那么就无脑空格健即可。

具体的展示 gif 图如下所示：

![录屏](https://user-images.githubusercontent.com/16025309/227933403-64e4cccd-218e-4eaf-9c40-8e7a35627b41.gif)


# 安装方式

### 三方插件管理库安装

支持任意的安装插件，这里以 Vundle 举例，在 `.vimrc` 中进行如下的编辑

```
" 安装依赖的插件库
Bundle 'https://github.com/2742195759/xvutils'

" 本仓库
Bundle 'https://github.com/2742195759/xv_quickjump'
```

### 自己安装
将 [xvutils](https://github.com/2742195759/xvutils) 与[本仓库](https://github.com/2742195759/xv_quickjump) 拷贝到某个目录下，比如是 `~/xkutils` 和 `~/xk_quickjump` ，然后在 `.vimrc` 中进行 rtp 的设定：
```
set rtp+=~/xvutils/
set rtp+=~/xk_quickjump/
```

# 启动

本仓库安装会默认启动，并且重写如下两个Keymap:

`s`: 启动基本跳转模式，1个prompt key。
`S`: 启动全局跳转模式，2个prompt key。
`<tab>` ：启动窗口跳转模式，0个prompt key。

# 自义定配置
- 可以自定义 label 的颜色：重写 QuickJump highlight来修改颜色

