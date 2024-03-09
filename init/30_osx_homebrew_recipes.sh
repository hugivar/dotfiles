# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
    abseil
    aom
    augeas
    bdw-gc
    bitwarden-cli
    blueutil
    brotli
    c-ares
    ca-certificates
    cairo
    capstone
    carapace
    certbot
    cffi
    clamav
    colima
    dialog
    dtc
    exa
    fd
    fish
    fontconfig
    freetype
    fribidi
    fzf
    gd
    gdbm
    gdk-pixbuf
    gettext
    gh
    giflib
    git-filter-repo
    glib
    gmp
    gnutls
    go
    graphite2
    graphviz
    gts
    guile
    harfbuzz
    heroku
    heroku-node
    highway
    hub
    icu4c
    imath
    jansson
    jasper
    jpeg
    jpeg-turbo
    jpeg-xl
    jq
    json-c
    jsoncpp
    libavif
    libevent
    libffi
    libgit2
    libgit2@1.6
    libice
    libiconv
    libidn2
    libmagic
    libnghttp2
    libpng
    librsvg
    libslirp
    libsm
    libssh
    libssh2
    libtasn1
    libtiff
    libtool
    libunistring
    libusb
    libuv
    libvmaf
    libx11
    libxau
    libxcb
    libxdmcp
    libxext
    libxmu
    libxrender
    libxt
    libyaml
    lima
    little-cms2
    llvm
    llvm@16
    lua
    lz4
    lzo
    m4
    moon
    mpdecimal
    ncurses
    netpbm
    nettle
    node
    nushell
    oh-my-posh
    oha
    oniguruma
    openexr
    openssl@1.1
    openssl@3
    p11-kit
    pango
    pcre
    pcre2
    pixman
    pkg-config
    podman
    powerlevel10k
    protobuf
    protobuf-c
    pycparser
    python-certifi
    python-cryptography
    python-pyparsing
    python-pytz
    python-setuptools
    python@3.10
    python@3.11
    python@3.12
    python@3.9
    qemu
    readline
    ruby
    rust
    six
    snappy
    spaceship
    sqlite
    starship
    stow
    supabase
    terraform
    tree
    unbound
    vde
    webp
    wget
    wmctrl
    xorgproto
    xz
    yara
    z3
    zoxide
    zplug
    zsh-async
    zstd
)

brew_install_recipes

# Misc cleanup!

# This is where brew stores its binary symlinks
local binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

# htop
if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" ]]; then
  e_header "Updating htop permissions"
  sudo chown root:wheel "$binroot/htop"
  sudo chmod u+s "$binroot/htop"
fi

# bash
if [[ "$(type -P $binroot/bash)" && "$(cat /etc/shells | grep -q "$binroot/bash")" ]]; then
  e_header "Adding $binroot/bash to the list of acceptable shells"
  echo "$binroot/bash" | sudo tee -a /etc/shells >/dev/null
fi
if [[ "$(dscl . -read ~ UserShell | awk '{print $2}')" != "$binroot/bash" ]]; then
  e_header "Making $binroot/bash your default shell"
  sudo chsh -s "$binroot/bash" "$USER" >/dev/null 2>&1
  e_arrow "Please exit and restart all your shells."
fi