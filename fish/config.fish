### base config ###
fish_vi_key_bindings

### alias definitions ###
alias ll='/opt/homebrew/bin/eza'
alias dud='du -sh'

### vars ###
# LLVM
set -Ux PATH /opt/homebrew/opt/llvm/bin $PATH
set -Ux LDFLAGS -L/opt/homebrew/opt/llvm/lib $LDFLAGS
set -Ux CPPFLAGS -I/opt/homebrew/opt/llvm/include $CPPFLAGS

# SDL3
set -g SDL3_DIR /usr/local
set -Ux PKG_CONFIG_PATH $SDL3_DIR/lib/pkgconfig $PKG_CONFIG_PATH
set -Ux LD_LIBRARY_PATH $SDL3_DIR/lib $LD_LIBRARY_PATH
set -Ux C_INCLUDE_PATH $SDL3_DIR/include:$C_INCLUDE_PATH
set -Ux LDFLAGS -L$SDL3_DIR/lib $LDFLAGS
set -Ux CPPFLAGS -I$SDL3_DIR/include $CPPFLAGS

### tools ###
# Set up fzf key bindings
fzf --fish | source
