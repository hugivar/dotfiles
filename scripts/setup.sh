# /bin/bash

# Setup Nushell
echo "Setting up Nushell"

## Maintain history
rm -f ~/Library/Application\ Support/nushell/config.nu
rm -f ~/Library/Application\ Support/nushell/env.nu

cp ~/dotfiles/nushell/default_config.nu ~/Library/Application\ Support/nushell/config.nu
cp ~/dotfiles/nushell/env.nu ~/Library/Application\ Support/nushell/env.nu

echo "Nushell setup complete"

# Setup Stow Symlinks
echo "Setting up Stow symlinks"

rm -rf ~/.config/wezterm

cd ~/dotfiles && stow .

echo "Stow symlinks setup complete"