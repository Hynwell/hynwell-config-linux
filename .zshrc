export CONFIGDIR="$HOME/.config"

#zstyle :compinstall filename '$CONFIGDIR/.zshrc'
zstyle :compinstall filename '$CONFIGDIR/.config/just/completions/just.zsh'
autoload -Uz compinit
compinit

PYTHON_PATH="$HOME/.local/bin"            
HISTFILE="$HOME/.zsh_history"             
EDITOR="vim"                              
HISTSIZE=10000                            
SAVEHIST=10000                           
setopt appendhistory                    

source $CONFIGDIR/zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $CONFIGDIR/zsh/.p10k2.zsh ]] || source $CONFIGDIR/zsh/.p10k2.zsh

# Alias
source ~/.config/zsh/.alias.zsh
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
