eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH:$HOME/.local/bin"

[[ -d "$HOME/go/bin" ]] && export PATH="$HOME/go/bin:$PATH"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"


[[ -f "$HOME/.local/.zprofile" ]] && . "$HOME/.local/.zprofile"
