alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias findps='ps -ax | grep'

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
