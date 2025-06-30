# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::dotenv
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::terraform

# Load completions
autoload -Uz compinit && compinit -u

zinit cdreplay -q

# Homebrew completions
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(direnv hook zsh)"

# Init shell theme and configuration
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/ohmyposh/zen.toml)"
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then # Prevent loading oh-my-posh in Apple_Terminal
  eval "$(oh-my-posh init zsh)"
fi

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Android development
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
# export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools:$PATH

# Set homebrew deps back into path, installing some of the android stuff overwrites sqlite
export PATH="$(brew --prefix)/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/pietervanderwerk/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/pietervanderwerk/.bun/_bun" ] && source "/Users/pietervanderwerk/.bun/_bun" # completions


# Go development
[ -n "$(go env GOBIN)" ] && export PATH="$(go env GOBIN):${PATH}"
[ -n "$(go env GOPATH)" ] && export PATH="$(go env GOPATH)/bin:${PATH}"

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

# Kubernetes stuff
export KUBECONFIG=~/.kube/config
