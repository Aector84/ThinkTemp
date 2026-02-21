# 🧊 ThinkTemp

A clean, production-grade **ThinkPad fan controller TUI** for Linux.

ThinkTemp provides live temperature monitoring and manual fan control directly from your terminal — safely, cleanly, and with kernel-level safeguards.

![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?logo=arch-linux&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-Official-blue)
![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-E95420?logo=ubuntu&logoColor=white)
![Fedora](https://img.shields.io/badge/Fedora-Supported-294172?logo=fedora&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-Supported-A81D33?logo=debian&logoColor=white)

![Version](https://img.shields.io/github/v/release/Aector84/ThinkTemp)

## Install Specific Version

git clone https://github.com/Aector84/ThinkTemp.git
cd ThinkTemp
git checkout v1.1.0

# 🧊 ThinkTemp
**Terminal fan controller & temperature monitor for ThinkPad laptops on Linux**

A clean, production-grade ThinkPad fan controller TUI with live temperature monitoring and manual fan control — built for clarity, safety, and performance.

---

## 📌 Table of Contents

1. [✨ Features](#-features)
2. [⚠️ Requirements](#️-requirements)
3. [📦 Installation](#-installation)
4. [📦 Dependencies](#-dependencies)
5. [🔧 ThinkPad Fan Control Setup](#-thinkpad-fan-control-required-for-manual-mode)
6. [🎮 Controls](#-controls)
7. [🛠 Troubleshooting](#-troubleshooting)
8. [⚠️ Known Issues](#️-known-issues)
9. [🚀 Roadmap](#-roadmap)
10. [🛡 Safety](#-safety)
11. [📜 License](#-license)

---

## 🎯 Why ThinkTemp?

There are other ThinkPad fan control utilities available, but ThinkTemp focuses on:

- 🧭 Clean, centered terminal UI
- ⚡ Instant manual control (0–7)
- 🛡 Built-in safety fallbacks
- 🔥 Overheat protection
- 🎛 Simple preset modes (Silent / Balanced / Performance)
- 📦 Easy installation as a system utility

ThinkTemp aims to feel lightweight, modern, and production-ready — not experimental.

---



---

## 🏷 Project Overview

ThinkTemp directly interfaces with the Linux `thinkpad_acpi` kernel module to provide safe, manual fan control on supported ThinkPad hardware.

It is designed for users who:

- Want precise thermal control
- Prefer terminal-based tools
- Need a lightweight alternative to background daemons
- Value safety mechanisms while overriding automatic fan curves


---

<img width="1130" height="966" alt="Screenshot" src="https://github.com/user-attachments/assets/c839d3ef-62be-413e-ad58-7761d6fd87ab" />

---

## ✨ Features

- 🌡 Live CPU temperature display  
- 🌀 Live fan RPM monitoring  
- 🎛 Manual fan levels (0–7)  
- ❄ Fan OFF mode  
- 🤖 Auto mode  
- 🔇 Silent / ⚖ Balanced / 🚀 Performance presets  
- 🔥 Overheat auto-fallback protection  
- 🛡 Kernel watchdog safety  
- 🧭 Clean centered TUI layout  
- 📦 Installable system utility  

---

## ⚠️ Requirements

- ThinkPad laptop
- Linux
- `thinkpad_acpi` with `fan_control=1`
- `lm-sensors`
- `python-rich`
- Root privileges

---

# 📦 Installation

Clone the repository:

```bash
git clone https://github.com/aector84/ThinkTemp.git
cd ThinkTemp
```

Run installer:

```bash
./install.sh
```

Launch:

```bash
sudo thinktemp
```

---

# 📦 Dependencies

## 🐍 Python

- Python **3.8+** (3.9+ recommended)

Check your version:

```bash
python3 --version
```

---

## 🎨 python-rich

Used for rendering the terminal UI.

**Arch / CachyOS**
```bash
sudo pacman -S python-rich
```

**Debian / Ubuntu**
```bash
sudo apt install python3-rich
```

**Fedora**
```bash
sudo dnf install python3-rich
```

Or via pip:

```bash
pip install rich
```

---

## 🌡 lm-sensors

Required for CPU temperature monitoring.

**Arch**
```bash
sudo pacman -S lm_sensors
```

**Debian / Ubuntu**
```bash
sudo apt install lm-sensors
```

**Fedora**
```bash
sudo dnf install lm_sensors
```

Detect sensors:

```bash
sudo sensors-detect
sensors
```

---

# 🔧 ThinkPad Fan Control (Required for Manual Mode)

ThinkTemp depends on the `thinkpad_acpi` kernel module with manual fan control enabled.

Check support:

```bash
cat /proc/acpi/ibm/fan
```

You must see:

```
commands: level <0-7, auto, disengaged, full-speed>
```

---

## 🧪 Enable Temporarily (Until Reboot)

```bash
sudo modprobe -r thinkpad_acpi
sudo modprobe thinkpad_acpi fan_control=1
```

Verify:

```bash
cat /proc/acpi/ibm/fan
```

Expected output:

```
status: enabled
```

---

## 💾 Enable Permanently (Fedora)

Create the configuration file:

```bash
sudo nano /etc/modprobe.d/thinkpad_acpi.conf
```

Add:

```
options thinkpad_acpi fan_control=1
```

Rebuild initramfs (Fedora uses dracut):

```bash
sudo dracut --force
```

Reboot:

```bash
sudo reboot
```

After reboot:

```bash
cat /proc/acpi/ibm/fan
```

You should see:

```
status: enabled
```

---

# 🔐 Root Privileges

ThinkTemp must be run with elevated privileges:

```bash
sudo thinktemp
```

This is required because it writes to:

```
/proc/acpi/ibm/fan
```

---

# 🎮 Controls

| Key | Action |
|-----|--------|
| 0 | Fan OFF |
| 1–7 | Manual fan levels |
| a | Auto mode |
| s | Silent preset |
| b | Balanced preset |
| p | Performance preset |
| q | Quit & restore auto |

---

# 🛠 Troubleshooting

## ThinkTemp does not start

Run with root:

```bash
sudo thinktemp
```

Verify shebang:

```bash
head -1 /usr/local/bin/thinktemp
```

Must be:

```
#!/usr/bin/env python3
```

Reinstall if needed:

```bash
./install.sh
```

---

## Manual fan control not available

```bash
cat /proc/acpi/ibm/fan
```

If missing commands:

```bash
sudo modprobe -r thinkpad_acpi
sudo modprobe thinkpad_acpi fan_control=1
```

---

## Temperatures not showing

Ensure sensors works:

```bash
sensors
```

If empty, run:

```bash
sudo sensors-detect
```

---

## Command not found: thinktemp

Check installation:

```bash
ls /usr/local/bin/thinktemp
```

Reinstall if missing:

```bash
./install.sh
```

---

# ⚠️ Known Issues

- Requires root privileges
- Only compatible with ThinkPad systems supporting `thinkpad_acpi`
- Some terminals may flicker in alternate screen mode
- RPM may briefly show `0` during transitions
- No non-ThinkPad support (yet)

---

# 🚀 Roadmap

## v1.1

- [ ] Config file support (`~/.config/thinktemp/`)
- [ ] Custom temperature threshold flag
- [ ] Version display in header
- [ ] Improved dependency detection
- [ ] Optional daemon mode
- [ ] Temperature history graph
- [ ] Improved terminal resize handling

---

## Future Ideas

- Universal Linux fan backend
- Profile saving
- AUR package
- systemd service mode
- JSON metrics export
- Lightweight monitor mode

---

# 🛡 Safety

ThinkTemp includes:

- Temperature fallback (default 80°C)
- Kernel watchdog timeout
- Automatic restore on exit

Manual fan control overrides automatic thermal management. Use responsibly.

---

# 📜 License

MIT License
