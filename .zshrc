#
# Executes commands at the start of an interactive session.
#

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=11'
ZSH_AUTOSUGGEST_STRATEGY=(
    # match_prev_cmd
    history
    completion
)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Keybindings

# Vim-like movement
bindkey -r '^[h'
bindkey -r '^[k'
bindkey '^[k' up-line-or-history
bindkey '^[j' down-line-or-history
bindkey '^[l' forward-char
bindkey '^[h' backward-char
bindkey '^[e' emacs-forward-word
bindkey '^[w' vi-forward-word

# Override __skimcmd used in the `skim-zsh` plugin.
__skimcmd() {
    which-command s
}

greeting_ascii_art() {
    ~/.neofetch-only-ascii/neofetch
}

greeting_machine_description() {
    # Print machine description
    source /etc/os-release
    distro=$NAME

    # No point in writing "Arch Linux" when we can simply write "Arch"
    if [[ $distro = *Arch* ]]
    then
        distro=Arch
    fi

    machine_description="%m $distro"

    # Add "WSL" to machine description if it is a WSL kernel
    if [[ $(uname -r) = *WSL* ]]
    then
        machine_description="$machine_description WSL"
    fi

    print -P "$machine_description"
}

greeting_date() {
    date +"%A %-d. %B %Y"
}

greeting_time_of_day() {
    if which toilet > /dev/null 2>&1
    then
        date +"%R" | toilet -f future
    else
        date +"%R"
    fi
}

sgr_reset() {
    printf "\e[0m"
}

sgr_bold() {
    printf "\e[1m"
}

sgr_256() {
    code=$1
    printf "\e[38;5;${code}m"
}

sgr_rgb() {
    r=$1
    g=$2
    b=$3
    printf "\e[38;2;$r;$g;${b}m"
}

greeting_x_centered() {
    if [ "$(date +'%M')" = "00" ]
    then
        cat $HOME/.dotfiles/mann-med-skjegg.txt | center --x-only
        echo ""
        echo "På tide å oppdatere? sudo pacman -Syu" | center --x-only
    else
        sgr_reset && greeting_ascii_art | center --x-only
    fi
    sgr_256 15 && greeting_machine_description | center --x-only
    sgr_bold   && sgr_256 15 && greeting_date | center --x-only
    sgr_bold   && sgr_256 4  && greeting_time_of_day | center --x-only
    sgr_reset
}

greeting() {
    if which center > /dev/null 2>&1
    then
        greeting_x_centered | center
    else
        echo ""
        if [ "$(date +'%M')" = "00" ]
        then
            cat $HOME/.dotfiles/mann-med-skjegg.txt
            echo ""
            echo "På tide å oppdatere? sudo pacman -Syu"
        else
            sgr_reset && greeting_ascii_art
        fi
        echo ""
        sgr_256 15             && greeting_machine_description
        echo ""
        sgr_bold && sgr_256 15 && greeting_date
        echo ""
        sgr_bold && sgr_256 4  && greeting_time_of_day
        sgr_reset
        echo ""
    fi
}

set_title_custom() {
    title "$(shrink_path -f)"
}

reset_cursor_style() {
   echo -ne '\e[0 q'
}

move_cursor_to_bottom_left () {
    printf "\e[$(expr $LINES - 1);H"
}

hide_cursor() {
    printf "\e[?25l"
}

show_cursor() {
    printf "\e[?25h"
}

print_newline() {
    echo ""
}

update_prompt_line_seed() {
    PROMPT_LINE_SEED=$(date +"%N")
}

PROMPT_LINE_THEME="rainbow"
PROMPT_LINE_CHARACTER="—"
PROMPT_LINE_SEED=$(date +"%N")
PROMPT_LINE=""
if [ -f $HOME/.fish_greeting_utils/target/release/horizontal_line ]
then
    add-zsh-hook precmd print_newline # Make sure output from last command is visible above prompt
    add-zsh-hook precmd update_prompt_line_seed
    PROMPT_LINE='$($HOME/.fish_greeting_utils/target/release/horizontal_line --zsh-prompt-colors --width $COLUMNS --theme $PROMPT_LINE_THEME --character $PROMPT_LINE_CHARACTER --seed $PROMPT_LINE_SEED)'
fi

serr() {
    PROMPT_LINE_THEME="white"
    clear
}

kult() {
    PROMPT_LINE_THEME="rainbow"
}

taktlaus() {
    PROMPT_LINE_THEME="taktlaus"
}

PROMPT='%{$(move_cursor_to_bottom_left)%}'"%{$(reset_cursor_style)%}%{$(show_cursor)%}$PROMPT_LINE$PROMPT"
# %{$(reset_cursor_style)%} # Not necessary when using vim bindings

if [ -f $HOME/.zoxide.zshrc ]
then
    source $HOME/.zoxide.zshrc
fi

source $HOME/.shellrc

if [ "$ZSH_DISABLE_GREETING" != "1" ]
then
    [[ $- == *i* ]] && greeting
fi
