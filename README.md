# 🧊 ThinkTemp

A clean, production-grade ThinkPad fan controller TUI for Linux.

ThinkTemp provides live temperature monitoring and manual fan control directly from your terminal.

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
