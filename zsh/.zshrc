# disable ctrl-l clearing the screen
bindkey -r "^L"

# make arguments to cd that aren't directories assumed to be a variable who's
# value is a directory. Useful for "aliasing" directories
setopt cdablevars
# turn on dir switching without cd
setopt autocd

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

# set editor
export EDITOR="$(which nvim)"

# Add scripts dir to path
export PATH="/Users/reed/Scripts:$PATH"

################################################################################
# ALIASES & HASHES (MacOS only)

# source main aliases script
source ~/.aliases

# stop using BSD sed, start using GNU sed
alias sed="gsed"

# listing (eza is an awesome ls replacement)
alias l="eza -l --icons --git --all --modified"
# list with 2-level tree
alias lt="eza --tree --level=2 --all --long --icons --git --modified"

# Directory Navigation

# fixing annoying mandatory [d]rop[b]ox folder name on linked account
alias db="cd /Users/reed/Can.\ Mun.\ Barometer\ Dropbox/Reed\ Merrill/cmb_main/"
# [p]rojects
alias p="cd /Users/reed/projects"
# [n]eovim [d]ot[f]iles
alias ndf='cd ~/dotfiles/nvim/.config/nvim/ && nvim .'
# [d]ot[f]iles
alias df='cd ~/dotfiles/nvim/.config/nvim/ && nvim .'

################################################################################
# INITIALIZATIONS

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# pnpm
export PNPM_HOME="/Users/reed/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/reed/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/reed/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/reed/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/reed/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export ucpw=$(security find-generic-password -a "$USER" -s ucalgarypw -w)
export GPG_TTY=$(tty)
