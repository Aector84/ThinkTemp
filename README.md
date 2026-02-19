# 🧊 ThinkTemp

A clean, production-grade ThinkPad fan controller TUI for Linux.

ThinkTemp provides live temperature monitoring and manual fan control directly from your terminal.

![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?logo=arch-linux&logoColor=white)
![CachyOS](https://img.shields.io/badge/CachyOS-Official-blue)
![Ubuntu](https://img.shields.io/badge/Ubuntu-Supported-E95420?logo=ubuntu&logoColor=white)
![Fedora](https://img.shields.io/badge/Fedora-Supported-294172?logo=fedora&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-Supported-A81D33?logo=debian&logoColor=white)

---

<img width="1130" height="966" alt="Screenshot" src="https://github.com/user-attachments/assets/c839d3ef-62be-413e-ad58-7761d6fd87ab" />

---

## ✨ Features

- Live CPU temperature display
- Live fan RPM monitoring
- Manual fan levels (0–7)
- Fan OFF mode
- Auto mode
- Silent / Balanced / Performance presets
- Overheat auto-fallback
- Kernel watchdog safety
- Clean centered TUI layout
- Installable system utility

---

## ⚠️ Requirements

- ThinkPad laptop
- `thinkpad_acpi` with `fan_control=1`
- Linux
- `python-rich`
- Root privileges

---

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/aector84/ThinkTemp.git
cd ThinkTemp
```

Run installer:

```bash
./install.sh
```

Then launch:

```bash
sudo thinktemp
```
---

## 📦 Dependencies

ThinkTemp requires the following components:

### 🐍 Python
- Python **3.8+** (3.9+ recommended)

Check your version:
```bash
python3 --version
```

---

### 🎨 python-rich
Used for rendering the terminal UI.

**Arch / CachyOS:**
```bash
sudo pacman -S python-rich
```

**Debian / Ubuntu / Mint / Pop!_OS:**
```bash
sudo apt install python3-rich
```

**Fedora:**
```bash
sudo dnf install python3-rich
```

Or via pip:
```bash
pip install rich
```

---

### 🌡 lm-sensors
Required for CPU temperature monitoring.

**Arch:**
```bash
sudo pacman -S lm_sensors
```

**Debian / Ubuntu:**
```bash
sudo apt install lm-sensors
```

**Fedora:**
```bash
sudo dnf install lm_sensors
```

After installation, detect sensors:

```bash
sudo sensors-detect
```

Verify output:

```bash
sensors
```

---

### 🖥 ThinkPad Kernel Support

ThinkTemp depends on the `thinkpad_acpi` kernel module with manual fan control enabled.

Verify support:

```bash
cat /proc/acpi/ibm/fan
```

You must see:

```
commands: level <0-7, auto, disengaged, full-speed>
```

If not enabled:

```bash
sudo modprobe -r thinkpad_acpi
sudo modprobe thinkpad_acpi fan_control=1
```

To enable permanently across reboots, create:

```
/etc/modprobe.d/thinkpad.conf
```

Add:

```
options thinkpad_acpi fan_control=1
```

---

### 🔐 Root Privileges

ThinkTemp must be run with elevated privileges:

```bash
sudo thinktemp
```

This is required because it writes to:

```
/proc/acpi/ibm/fan
```

---

## 🧾 Summary

| Component | Required | Purpose |
|------------|----------|----------|
| Python 3.8+ | ✅ | Runtime |
| python-rich | ✅ | TUI rendering |
| lm-sensors | ✅ | Temperature monitoring |
| thinkpad_acpi | ✅ | Fan control |
| Root access | ✅ | Hardware control |

---

## 🛠 Troubleshooting

If ThinkTemp does not work as expected, check the following:

---

### ❓ ThinkTemp does not start

Make sure you are running it with root privileges:

```bash
sudo thinktemp
```

If it still fails, verify the shebang line:

```bash
head -1 /usr/local/bin/thinktemp
```

It must be:

```
#!/usr/bin/env python3
```

If not, reinstall:

```bash
./install.sh
```

---

### ❓ `Manual fan control not available`

Verify that your system supports manual fan control:

```bash
cat /proc/acpi/ibm/fan
```

You must see:

```
commands: level <0-7, auto, disengaged, full-speed>
```

If not enabled:

```bash
sudo modprobe -r thinkpad_acpi
sudo modprobe thinkpad_acpi fan_control=1
```

To enable permanently:

Create:

```
/etc/modprobe.d/thinkpad.conf
```

Add:

```
options thinkpad_acpi fan_control=1
```

Reboot afterward.

---

### ❓ Temperatures not showing

Ensure `lm-sensors` is installed:

```bash
sudo pacman -S lm_sensors        # Arch
sudo apt install lm-sensors      # Debian/Ubuntu
sudo dnf install lm_sensors      # Fedora
```

Then run:

```bash
sudo sensors-detect
sensors
```

If `sensors` does not output CPU temperatures, ThinkTemp cannot display them.

---

### ❓ Fan RPM shows 0

If RPM shows `0`, the fan may be in passive or off state.  
Try pressing:

- `1–7` to manually set a fan level
- `a` to return to auto mode

---

### ❓ Screen flickers or appears blank

Some terminals may behave differently with alternate screen mode.

Try:

- Resizing the terminal
- Pressing `q` to exit
- Running via:

```bash
sudo python3 src/thinktemp
```

---

### ❓ Command not found: thinktemp

Ensure it is installed to `/usr/local/bin`:

```bash
ls /usr/local/bin/thinktemp
```

If missing:

```bash
./install.sh
```

---

If problems persist, open a GitHub issue and include:

- Distro name
- Kernel version (`uname -r`)
- Output of `cat /proc/acpi/ibm/fan`
- Output of `sensors`


---

## ⚠️ Known Issues

- Requires root privileges (`sudo`)
- Only compatible with ThinkPad systems supporting `thinkpad_acpi`
- Some terminals may flicker when using alternate screen mode
- Fan RPM may briefly display `0` when switching levels
- Does not yet support non-ThinkPad hardware

If you encounter issues, please open a GitHub issue with:

- Your distro
- Kernel version
- Output of `cat /proc/acpi/ibm/fan`

---

## 🚀 Roadmap

### 🔹 v1.1 (Planned)

- [ ] Config file support (`~/.config/thinktemp/`)
- [ ] Custom temperature threshold flag (`--threshold`)
- [ ] Subtle version display in TUI header
- [ ] Improved error handling for missing dependencies
- [ ] Optional daemon mode
- [ ] Temperature history graph panel
- [ ] Better terminal resize handling

---

### 🔮 Future Ideas

- Universal Linux fan control backend
- Profile saving (Silent / Balanced / Performance)
- AUR package
- systemd service mode
- Export metrics to JSON
- Lightweight monitoring mode (`--monitor`)

---

## 🎮 Controls

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

## 🛡 Safety

ThinkTemp includes:

- Temperature fallback (default 80°C)
- Kernel watchdog timeout
- Auto restore on exit

Use manual fan control responsibly.

---

## 📜 License

MIT License
