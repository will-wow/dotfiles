# Dotfiles

Just my dotfiles. They're not that fancy.

## Use

One-liner to download and apply

```bash
chezmoi init --apply --verbose will-wow
```

### Update

```bash
chezmoi update
```

## Config

To edit config to add languages, edit:

```bash
$HOME/.config/chezmoi/chezmoi.toml
```

Or re-run init to repopulate

```bash
chezmoi init
```

## WSL VS Code

For a chezmoi repo stored in WSL, to update the windows VS Code settings:

```bash
cat dot_config/Code/User/keybindings.json.tmpl | chezmoi execute-template > /mnt/c/Users/<userDir>/AppData/Roaming/Code/User/keybindings.json
cat dot_config/Code/User/settings.json.tmpl | chezmoi execute-template > /mnt/c/Users/<userDir>/AppData/Roaming/Code/User/settings.json
```
