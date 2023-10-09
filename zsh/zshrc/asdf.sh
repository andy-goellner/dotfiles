if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . $HOME/.asdf/asdf.sh
fi

export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed
