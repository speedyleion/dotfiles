# Zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

(( $+commands[thefuck] )) && eval $(thefuck --alias)

zicompinit

# For MacOS
export CLICOLOR=1
# For *nix and fzf-tab
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'   

# fzf binary from GitHub releases, placed on PATH for the shell (and nvim)
zinit ice from"gh-r" as"program" ver"v0.73.1"
zinit light junegunn/fzf

# Binaries from GitHub releases (extract'!' flattens the nested dir).
# Usage: _gh_bin <repo> <version> <binary> [linux-bpick] [mac-bpick]
_gh_bin() {
    local bpick
    case $OSTYPE in
        linux*)  bpick=$4 ;;
        darwin*) bpick=$5 ;;
    esac
    zinit ice from"gh-r" as"program" ver"$2" ${bpick:+bpick"$bpick"} extract"!" pick"$3"
    zinit light $1
}
_gh_bin BurntSushi/ripgrep 15.2.0  rg
# fd and lsd ship both gnu and musl for Linux; prefer the static musl build.
_gh_bin sharkdp/fd         v10.5.0 fd    '*musl*'
_gh_bin lsd-rs/lsd         v1.2.0  lsd   '*musl*'
_gh_bin gitui-org/gitui    v0.28.1 gitui ''       'gitui-mac.tar.gz'
unfunction _gh_bin

zinit light Aloxaf/fzf-tab
# Works fine in normal terminal, no popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# Don't sort, it will sort by sha
zstyle ':completion:*:git-checkout:*' sort false
# Nice colors in the list
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# displays groups
zstyle ':completion:*' format '[%d]'
# Removes the `.` prefix
zstyle ':fzf-tab:*' prefix ''
# Use brackets to move between groups
zstyle ':fzf-tab:*' switch-group '<' '>'

zinit light zsh-users/zsh-autosuggestions   

# Be able to see dot files, `.foo`, when completing
_comp_options+=(globdots)

[[ -f "$HOME/.local/.zshrc" ]] && . "$HOME/.local/.zshrc"

