# 🍌 Banana Mod Manager

A fast, cross-platform mod manager for [Gorilla Tag](https://www.gorillatagvr.com/). Download, install, update, and manage your mods from one clean window — built with [Avalonia UI](https://avaloniaui.net/) on .NET 9.

<p align="center">
  <img src="Assets/light-showcase.png" alt="Banana Mod Manager — light theme" width="45%" />
  &nbsp;
  <img src="Assets/dark-showcase.png" alt="Banana Mod Manager — dark theme" width="45%" />
</p>

## Features

- 🛠️ One-click mod install, update, and uninstall
- 📂 Install mods from disk (`.dll`)
- 🚀 Launch Gorilla Tag (Steam)
- ⚙️ Built-in config editor for your mods
- 🍃 Enable/disable all mods without uninstalling them
- 🔄 Automatic BepInEx installation and configuration
- 🛰️ Pastebin-controlled update notifications — message + update prompt driven by one paste
- 🎨 Multiple themes (light, dark, high contrast, and more)
- 📡 Live mod list kept up to date with the community
- 🎮 Discord Rich Presence

## Download

| Platform | Download |
| -------- | -------- |
| Windows (x64) | [BananaModManager.exe](https://github.com/Snoopy941/Banana-Mod-Manager/releases/latest/download/BananaModManager.exe) |
| Linux (x64) | [BananaModManager](https://github.com/Snoopy941/Banana-Mod-Manager/releases/latest/download/BananaModManager) |

> ℹ️ Releases are self-contained single-file builds for Windows and Linux.

On Linux, make the binary executable before running it:

```bash
chmod +x BananaModManager
./BananaModManager
```

## Updates (Pastebin control file)

The manager is a single `BananaModManager.exe` — updates are driven by one Pastebin paste it checks on every launch.

### Setup

1. Create a paste at [pastebin.com](https://pastebin.com) with this format:

   ```
   version=1.4.2
   url=https://github.com/Snoopy941/Banana-Mod-Manager/releases/latest/download/BananaModManager.exe
   message=What's new in 1.4.2!
   ```

2. Open the paste and copy its **RAW** link (looks like `https://pastebin.com/raw/xxxxx`).
3. Set `PasteUrl` (a constant near the top of `BananaModManager/MainWindow.axaml.cs`) to that raw link.
4. Build with `./build.ps1`.

A ready-to-paste template lives in `paste-template.txt` at the repo root.

### How it works

- On every launch the manager fetches the paste.
- The `message` is shown **once per new message** (tracked in the config — it never nags twice).
- When the paste `version` is newer than the installed one, the message dialog shows an **Update Now** button that opens the [GitHub releases page](https://github.com/Snoopy941/Banana-Mod-Manager/releases/latest).
- Supported fields:
  - `version` — the latest version
  - `url` — download link for `BananaModManager.exe`
  - `message` — one-time note shown in the manager ("what's new", announcements)
  - `enabled` — set to `0` to stop the manager from launching entirely

## Discord Rich Presence

Your Discord status is tied to a **Discord application** — the app name shown in your status comes from that application's developer page, not from this code. The current build points at the original `MonkeModManager` Discord app, which is why your status says "Monke Mod Manager" instead of "Banana Mod Manager".

To use your own:

1. Open the [Discord Developer Portal](https://discord.com/developers/applications) and create a new application (e.g. `Banana Mod Manager`).
2. Copy the **Application ID** from the *General Information* page.
3. In `MainWindow.axaml.cs`, replace the value of `DiscordApplicationId` (a constant at the top of the class) with your ID.
4. Optional: upload a square icon under **Rich Presence → Art Assets**, then set `DiscordLargeImageKey` to that asset's key (default `mmm_ico`).
5. Rebuild and release.

## Building from source

Requirements: [.NET 9 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)

```bash
# Build (Debug)
dotnet build

# Publish self-contained, single-file binaries for Windows and Linux
./build.ps1
```

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## Legal

> This product is not affiliated with Another Axiom Inc. or its videogames Gorilla Tag and Orion Drift, and is not endorsed or otherwise sponsored by Another Axiom. Portions of the materials contained herein are property of Another Axiom. ©2021 Another Axiom Inc.

Enjoy! 🍌
