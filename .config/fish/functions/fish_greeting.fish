# Defined in /usr/share/fish/functions/fish_greeting.fish @ line 1
function fish_greeting
    if not set -q fish_greeting
        set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
        set -l line2 \n(printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
        set -g fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    # test -n "$fish_greeting"
    #     and echo $fish_greeting
  
    # set_color FF0000
    # echo "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"
    # set_color FF8800
    # echo "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    # set_color FFFF00
    # echo "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
    # set_color brcyan
    # echo "Omar Arch WSL" | figlet -w $COLUMNS -f ~/figlet_fonts/small.flf
    # set_color 00FF00
    # echo "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
    # set_color 0000FF
    # echo "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    # set_color 8800FF
    # echo "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
    # set_color FF00FF
    # echo "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    # set_color normal
    # fish_logo
    # echo ""
    # set_color brgreen
    # echo "Omar Arch WSL" | figlet -w $COLUMNS -f ~/figlet_fonts/small.flf -c
    # curl "wttr.in?0" --silent --max-time 3 | ~/fish_greeting_utils/target/release/center $COLUMNS
    set_color normal
    ~/.fish_greeting_utils/target/release/main ~/.fish_greeting_utils/ fish
    # date +"%A %-d. %B %Y" | figlet -w $COLUMNS -f ~/figlet_fonts/slscript.flf | ~/fish_greeting_utils/target/release/center $COLUMNS
    set_color brcyan
    echo "Omar Arch WSL" | center
    set_color normal
    date +"%A %-d. %B %Y" | center
    set_color cyan
    date +"%R" | toilet -w $COLUMNS -f future | center
    set_color normal
    # git -C ~/taktlausveven fetch
end
