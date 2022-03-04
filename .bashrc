# Launch Zsh
if [ -t 1 ]; then
exe zsh
fi

PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
