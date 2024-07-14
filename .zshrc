
alias ls="eza --tree --level=1 --icons=always --no-time --no-user --no-permissions"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/keofoxy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source /Users/keofoxy/.docker/init-zsh.sh || true # Added by Docker Desktop

clear
neofetch
