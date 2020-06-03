## Left Prompt
function fish_prompt
    # Set the annoying greeting to empty
    set fish_greeting
    set -l last_status $status
    # Show the current working directory
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    # Show the git status
    set_color $fish_color_git
    set -g __fish_git_prompt_showupstream auto
    echo -n (fish_git_prompt)
    # Back to normal
    set_color normal
    echo -n ' $ '
end

## Right Prompt
function fish_right_prompt
    set_color white
    echo -n (date +"%H:%M")
    set_color normal
end

## Window title
function fish_title
    echo -n 'fish in '
    prompt_pwd
end

## Coloring
set fish_color_autosuggestion black
set fish_color_command normal
set fish_color_comment black
set fish_color_cwd blue
set fish_color_cwd_root red
set fish_color_end magenta
set fish_color_error yellow
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match blue
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param blue
set fish_color_quote green
set fish_color_redirection blue
set fish_color_search_match --background=black
set fish_color_selection blue
set fish_color_status red
set fish_color_user red
set fish_color_git red
set fish_pager_color_completion blue
set fish_pager_color_description yellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

## Aliases
alias ls "ls --group-directories-first"
alias lsl "ls --group-directories-first -lh"
alias search "apt-cache search"
alias install "sudo apt-get install --no-install-recommends"
alias upgrade "sudo apt-get upgrade"
alias update "sudo apt-get update"
alias remove "sudo apt-get remove"
alias purge "sudo apt-get remove --purge"
alias clean "sudo apt-get clean"
alias autoclean "sudo apt-get autoclean"
alias autoremove "sudo apt-get autoremove"
alias apthelp "sudo apt-get --help"
alias reconfigure "sudo dpkg-reconfigure"
alias pkglist "dpkg --get-selections | grep -v deinstall | sed s/\tinstall//g"
alias version "apt-cache policy"
alias font-refresh "fc-cache -fv"
alias urxvt-refresh "xrdb ~/.Xresources"
alias gclone "git clone"
alias gstatus "git status"
alias gfetch "git fetch --prune --all"

## Keybinding
set fish_key_bindings fish_default_key_bindings
