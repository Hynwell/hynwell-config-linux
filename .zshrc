### PATH VARIABLES ###

PYTHON_PATH="$HOME/.local/bin"            # Путь к бинарникам Python
HISTFILE="$HOME/.zsh_history"             # Файл, в который будет записываться вся история команд на zsh
EDITOR="vim"                              # Редактор по умолчанию
HISTSIZE=10000                            # Количество сохраненных команд в файле
SAVEHIST=10000                            # Как много команд шелл должен помнить в одной сессии (по команде history)
setopt appendhistory                      # Сохраняем всю историю в файл, чтобы она не стиралась, если мы выключим и включим шелл



export CONFIGDIR="$HOME/.config"



source $CONFIGDIR/zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $CONFIGDIR/zsh/.p10k2.zsh ]] || source $CONFIGDIR/zsh/.p10k2.zsh

# Alias
source ~/.config/zsh/.alias
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
