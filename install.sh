# Change these directories
DOTS_STORAGE="$HOME/_vault/dots/"

echo 'Installing zsh config files...'
stow zsh -t $HOME

echo 'Installing dotfiles...'
stow \
    niri \
    alacritty \
    kitty \
    fastfetch \
    kanshi \
    mangohud \
    noctalia \
    btop \
    gtk \
    qt \
    systemd \
    portals \
    misc \
    -t $DOTS_STORAGE
