. ~/.profile
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# use secret for keys
[[ -f ~/.secret ]] && . ~/.secret

# use seperate dotfile for landchecker
[[ -f ~/.landchecker ]] && . ~/.landchecker

###-tns-completion-###
[[ -f ~/.tnsrc ]] && . ~/.tnsrc 
