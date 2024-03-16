# Windows dot files

## Plugins list

- [Microsoft Terminal](https://github.com/microsoft/terminal) - the most powerful terminal emulator for Windows.
  - Color Scheme: One Half Dark
  - Font: Fira Code
- [Fira Code](https://github.com/tonsky/FiraCode) - best font for programmers with ligatures.
- [neovim](https://neovim.io/) - best terminal editor.
- [PSReadLine](https://github.com/PowerShell/PSReadLine) - autocompletion and syntax highlight for PowerShell.
- [PoshGit](https://github.com/dahlbyk/posh-git) - amazing utilities for git on Windows. My [fork](https://github.com/ra0to/posh-git) with small improvements.
- [PsGit](https://github.com/ra0to/psgit) - ported git aliases from OhMyZSH.
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - a smarter `cd` command.
- [Delta](https://github.com/dandavison/delta) - a syntax-highlighting pager for git, diff, and grep output.
- [bat](https://github.com/sharkdp/bat) - a `cat` clone with wings.
- [ripGrep](https://github.com/BurntSushi/ripgrep) - `ripgrep` recursively searches directories for a regex pattern while respecting your gitignore.
- [fzf](https://github.com/junegunn/fzf) - a command-line fuzzy finder.
- [fd](https://github.com/sharkdp/fd) - simple, fast and user-friendly alternative to `find`.

## Installation guide

- Clone the repo and put all files under `.configs` dir into the home directory
- Install all plugins from the list.
- Create a PowerShell profile under the `$PROFILE` path.
- Create a Plugins folder at `~/.configs/powershell/plugins`.
- Clone `PoshGit` and `PsGit` to the `plugins` folder.
- Install android utils:
  - Download [SDK Platform Tools](https://developer.android.com/tools/releases/platform-tools).
  - Unzip the archive and place it under "C:\Program Files\Android\Tools".
  - Add tools location to the PATH environment variable.
  - Restart a terminal and check if the command `adb --version` executes successfully.
- Configure search paths for the build installation function.
- Run `scripts/create-symlinks.ps1` script.

### Neovim setup

Install neovim. Create a symlink to the configuration file `.configs/nvim/init.lua`.

```powershell
New-Item -ItemType SymbolicLink -Path "$HOME\AppData\local\nvim\init.lua" -Target "$HOME\.configs\nvim\init.lua"
```

Note: you should execute this command with the administrator priviledges.
