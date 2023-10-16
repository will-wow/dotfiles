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