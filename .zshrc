### Prompt
autoload -U colors && colors	# Load colors
autoload -Uz vcs_info 		# Git info
setopt prompt_subst

### git prompt!!!!
# source ~/.gitstatus/gitstatus.prompt.zsh
#PS1='%F{blue}%~ %f$GITSTATUS_PROMPT 
#%(?.%F{green}.%F{red})$ %f'


# eval "$(oh-my-posh init zsh)"
# eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/craver.omp.json)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt SHARE_HISTORY #to hist immediatelly form every session
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/moritz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


### ALIAS ###
alias dots='/usr/bin/git --git-dir=/User$s/moritz/.dots/ --work-tree=/Users/moritz'
alias dotsp='~/.scripts/push_dots.sh'
alias gitcp='git add .; git commit -m \"c\"; git push'
alias ll='/opt/homebrew/bin/eza'
alias hist='history 0'
alias bat='bat --theme=TwoDark'


### LLVM ###
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include $CPPFLAGS"


### NCURSES ###
# export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/ncurses/lib $LDFLAGS"
# export CPPFLAGS="-I/opt/homebrew/opt/ncurses/include $CPPFLAGS"
# export C_INCLUDE_PATH="/opt/homebrew/opt/ncurses/include:$C_INCLUDE_PATH"


### SDL2 ###
export PATH="/opt/homebrew/Cellar/sdl2/2.30.5/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/Cellar/sdl2/2.30.5/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/Cellar/sdl2/2.30.5/include $CPPFLAGS"
export C_INCLUDE_PATH="/opt/homebrew/Cellar/sdl2/2.30.5/include:$C_INCLUDE_PATH"

### SDL3 ###
export SDL3_DIR="/usr/local"
export PKG_CONFIG_PATH="$SDL3_DIR/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$SDL3_DIR/lib:$LD_LIBRARY_PATH"
export C_INCLUDE_PATH="$SDL3_DIR/include:$C_INCLUDE_PATH"
export LDFLAGS="-L$SDL3_DIR/lib $LDFLAGS"
export CPPFLAGS="-I$SDL3_DIR/include $CPPFLAGS"

### SDL3 ###
# export LIBRARY_PATH="/Users/moritz/Libs/SDL3/lib:$LIBRARY_PATH"
# export LDFLAGS="-L/Users/moritz/Libs/SDL3/lib $LDFLAGS"
# export CPPFLAGS="-I/Users/moritz/Libs/SDL3/include $CPPFLAGS"
# export C_INCLUDE_PATH="/Users/moritz/Libs/SDL3/include:$C_INCLUDE_PATH"

### PKG-CONFIG ###
# export PKG_CONFIG_PATH="/Users/moritz/libs/SDL3/lib/pkgconfig:$PKG_CONFIG_PATH"


### FZF ###
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

### emacs eat ###
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/zsh"

