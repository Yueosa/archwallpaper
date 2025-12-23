# 🖼️ Video Wallpaper Auto Switch Script (mpvpaper)

这是一个基于 mpvpaper 的视频壁纸自动切换脚本，用于在 Wayland 桌面环境 下随机播放本地 mp4 视频作为动态壁纸。

脚本支持：

- 🎲 随机选择视频壁纸
- 🔁 定时自动切换

---

## ⚠️ 环境要求与兼容性说明

##### Wayland（必须）

本脚本 仅适用于 Wayland 会话，因为 mpvpaper 依赖 Wayland 的 layer-shell 协议。

#### 已验证 / 推荐的 Wayland 合成器

- ✅ Hyprland（强烈推荐）
- ✅ sway / 其他 wlroots 系
- ⚠️ KDE Plasma (Wayland)（部分版本可用，稳定性不保证）
- ❌ GNOME Wayland（不支持 mpvpaper）
- ❌ 所有 X11 桌面环境（完全不支持）

> 如果你正在使用 X11，请改用 feh / xwinwrap 等方案，本脚本不适用。

---

## 📂 脚本行为说明

- 默认从目录中随机选择一个 .mp4 文件
- 启动新壁纸前会自动结束已有的 mpvpaper 进程
- 支持两种模式：
  - change：立即切换一次壁纸
  - loop：后台定时循环切换（默认 10 分钟）

---

## 🚀 推荐配置（Hyprland）

如果你使用的是 Hyprland，强烈建议加入以下配置：

#### 1️⃣ 开机自动启动壁纸循环

在 `~/.config/hypr/hyprland.conf` 中添加：

```conf
exec-once = bash $HOME/YeaSrine/Script/wall-cycle.sh loop
```

这会在 Hyprland 启动时，自动在后台运行壁纸轮换。

#### 2️⃣ 快捷键手动切换壁纸

同样在 `hyprland.conf` 中添加：

```conf
bind = SUPER ALT, W, exec, bash -c "$HOME/YeaSrine/Script/wall-cycle.sh change"
```

按下 Super + Alt + W 即可立刻切换到一张新的随机视频壁纸 ✨
