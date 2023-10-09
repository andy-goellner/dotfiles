if uname -m | grep -q 'arm64'; then
  export PATH="/opt/homebrew/bin:$PATH"
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
else
  export PATH="/usr/local/bin:$PATH"
fi

eval "$(brew shellenv)"

# Prevents issue with macos 12 https://github.com/rails/rails/issues/38560#issuecomment-1025999712
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


export DOCKER_DEFAULT_PLATFORM=linux/amd64

export BUNDLE_GEM__FURY__IO=
export GITLAB_PAT=
export GITLAB_CI_TOKEN=$GITLAB_PAT
export CI_JOB_TOKEN=$GITLAB_PAT

export TELEPORT_PROXY="heimdallr.checkrhq.net"
export TELEPORT_AUTH="gitlab"


source ~/shell_scripts/tuse.sh

alias docker-login="echo "$GITLAB_PAT" | docker login -u "${GITLAB_USERNAME:-${USER}}" gitlab-registry.checkrhq.net --password-stdin"
alias profile="uname -m"

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH


# PG Libraries for Pricing
export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# Sorbet
export SRB_SKIP_GEM_RBIS=true
