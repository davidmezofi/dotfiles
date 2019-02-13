# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Using powerline in the shell
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi

# Using the solarized skin for mc
export MC_SKIN=$HOME/.config/mc/solarized.ini
# After hitting F10 in mc we would like to land in the directory opened in the
# current panel
source /usr/libexec/mc/mc.sh

PATH=$PATH:~/myscripts

# Use vim as my default editor
export EDITOR=vim

# Set zathura to `fork` by default
alias zathura='zathura --fork'

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/davex/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/davex/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/davex/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/davex/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
