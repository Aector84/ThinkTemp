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
