# Change these directories
DOTS_STORAGE="$HOME/_vault/dots/"
BINARY_STORAGE="$HOME/.local/bin"

echo 'Installing zsh config files...'
stow zsh -t $HOME

echo 'Installing required binaries...'
stow eplayerctl -t $BINARY_STORAGE

echo 'Installing dotfiles...'
stow \
    rofi \
    niri \
    alacritty \
    htop \
    kitty \
    fastfetch \
    gtklock \
    hypr \
    kanshi \
    mangohud \
    gtk \
    qt \
    swaync \
    swayosd \
    waybar \
    systemd \
    wlogout \
    portals \
    misc \
    -t $DOTS_STORAGE
