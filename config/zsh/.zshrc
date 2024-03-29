# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Pure prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Set default environment
export XSESSION=openbox

# Aliases
alias vim="/usr/bin/nvim"
alias emulator="nohup ~/Android/Sdk/emulator/emulator -avd Pixel_3a_API_34_extension_level_7_x86_64 &> /dev/null &"

# Add SDKs to PATH
export PATH=$PATH:~/Development/SDK/flutter/bin
export PATH=$PATH:~/Development/SDK/dart/bin

# Add android-studio to PATH
export PATH=$PATH:~/Development/android-studio/bin

# Add Games to PATH
export PATH=$PATH:~/Games/tetrio-desktop

# Add Rust binaries to PATH
export PATH=$PATH:~/.cargo/bin

# Add payload-dumper-go to PATH
export PATH=$PATH:~/Documents/tapas/payload-dumper
