
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history

source ~/.config/zsh/powerlevel9k/powerlevel9k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Alias
source ~/.config/zsh/.alias
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
