autoload -Uz compinit promptinit
compinit
promptinit
bindkey -v

PROMPT="%n@%m:%(5~|%-1~/../%3~|%4~) %# "

# Alias for fun
alias grep='grep --color'
alias ls='ls --color=auto'

# Environtment variables for wayland
QT_QPA_PLATFORM=wayland
QT_QPA_PLATFORMTHEME=qt5ct
MOZ_ENABLE_WAYLAND=1

# osc7 for footerm
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd
