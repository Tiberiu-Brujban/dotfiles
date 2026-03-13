# Starship prompt
eval "$(starship init zsh)"

echo 'export QT_QPA_PLATFORM=xcb' >> ~/.zshrc

# Zsh Autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Zsh Syntax Highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# LS Colors (like Bash)
autoload -U colors && colors

# Load default LS_COLORS
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

# Remove underline but keep colors
# ZSH_HIGHLIGHT_STYLES[path]='fg=brightwhite'
# ZSH_HIGHLIGHT_STYLES[command]='fg=green'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
# ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
# ZSH_HIGHLIGHT_STYLES[function]='fg=green'
# ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#585b70'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a6e3a1,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fab387,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#cba6f7'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#a6e3a1'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#f38ba8'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f9e2af'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#cdd6f4'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[path]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#cba6f7'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[default]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#cdd6f4'


ls() {
    command ls --color=auto "$@"
}
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

# LS_COLORS="di=34:fi=0:ln=36:pi=33:so=35:bd=33;01:cd=33;01:ex=32:*.sh=32:*.py=32:*.zip=31:*.tar=31:*.gz=31:*.jpg=35:*.png=35"
# export LS_COLORS

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
fc -R

# Neovim projects shortcut
nvimp() {
    cd ~/hdd/nvim || return
    nvim .
}
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM=xcb
