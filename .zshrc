#{{{ Prompt, Titlebar and Taskbar Settings
# Gentoo style prompt settings
if [ $UID -eq 0 ]; then
	PROMPT="%{%F{red}%}%B%M %{%F{blue}%}%1~ #%b %f"
else
	PROMPT="%{%F{green}%}%B%n@%M %{%F{blue}%}%1~ $%b %f"
fi

case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd () { print -Pn "\e]0;%n@%M %~\a" } 
		preexec () { print -Pn "\e]0;$1\a" }
	;;
    screen|screen-256color)
    	precmd () { 
			print -Pn "\e]83;title \"$1\"\a" 
			print -Pn "\e]0;$TERM\a" 
		}
	preexec () { 
			print -Pn "\e]83;title \"$1\"\a" 
			print -Pn "\e]0;$TERM - $1\a" 
		}
	;; 
esac
#}}}

#{{{ History Settings
# Set history size
export HISTSIZE=10000
# Set saved history
export SAVEHIST=10000
# Set history file
export HISTFILE=~/.zsh_history
# Share history in multiple sessions
setopt SHARE_HISTORY
# Remove duplication history
setopt HIST_IGNORE_DUPS
# Ignore commands with leading space
setopt HIST_IGNORE_SPACE
# Enable timestamp by default
setopt EXTENDED_HISTORY
# Append history instead of replacing
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
# Extended glob
setopt EXTENDED_GLOB
# Do not change backgroud niceness
setopt NO_BG_NICE
# Disable beep
unsetopt BEEP
#}}}

#{{{ Key Bindings
# Function key bindings
bindkey "\e[1~"	  beginning-of-line
bindkey "\e[2~"   insert-last-word
bindkey "\e[3~"   delete-char
bindkey "\e[4~"   end-of-line
bindkey "\e[5~"   backward-word
bindkey "\e[6~"   forward-word
bindkey "\e[7~"   beginning-of-line
bindkey "\e[8~"   end-of-line
bindkey "\e[A"    up-line-or-search
bindkey "\e[B"    down-line-or-search
bindkey "\e[C"    forward-char
bindkey "\e[D"    backward-char
bindkey "\eOH"    beginning-of-line
bindkey "\eOF"    end-of-line
bindkey "\e[H"    beginning-of-line
bindkey "\e[F"    end-of-line

bindkey "^p"      up-line-or-search
bindkey "^n"      down-line-or-search
bindkey '^f'      forward-word
bindkey '^b'      backward-word
bindkey '^j'      backward-kill-word
bindkey '^k'      kill-word
bindkey '^u'      transpose-chars
bindkey '^t'      quoted-insert
bindkey '^g'      kill-line
bindkey '^w'      backward-kill-line
# Use vim to edit command line
autoload -U       edit-command-line
zle -N            edit-command-line
bindkey '^o'      edit-command-line
# Insert "sudo" in front of commands
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    # Move to end of line
    zle end-of-line
}

zle -N sudo-command-line
bindkey '^y'     sudo-command-line

# ctrl + a 行首
# ctrl + b 往左移动一个词
# ctrl + c 发送 SIGINT 信号
# ctrl + d 结束输入
# ctrl + e 行尾
# ctrl + f 往右移动一个词
# ctrl + g 删除右边所有内容
# ctrl + h 退格
# ctrl + i tab
# ctrl + j 删除左边一个词
# ctrl + k 删除右边一个词
# ctrl + l 清屏
# ctrl + m 回车
# ctrl + n 下一个历史命令
# ctrl + o 用 vim 编辑命令行
# ctrl + p 上一个历史命令
# ctrl + q 恢复
# ctrl + r 搜索历史命令
# ctrl + s 冻结
# ctrl + t 输入转义字符
# ctrl + u 交换左边两个字符
# ctrl + v 输入转义字符
# ctrl + w 删除左边所有内容
# ctrl + x 很多功能
# ctrl + y 命令前添加 sudo
# ctrl + z 休眠当前进程
#}}}

#{{{ Auto Completion Settings
# Auto complete paths
setopt complete_in_word

# Deal these characters as part of the word
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
# Auto complete
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
# Force rehash
_force_rehash() {
    ((CURRENT == 1)) && rehash
    return 1    # Because we didn't really complete anything
}
zstyle ':completion:::::' completer _force_rehash _complete _approximate
# Other completions
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
# Enable completion cache
zstyle ':completion::complete:*' use-cache 1
# Path completions
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'
# Colorized completion menu
export ZLSCOLORS=$LS_COLORS
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Enable case correction
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# Enable spelling correction
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# Group completion types
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
# "kill" command completions
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'
# "cd ~" completions
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# Empty line "cd ~" completions
user-complete() {
    case $BUFFER {
        "" )
            # 空行填入 "cd "
            BUFFER="cd "
            zle end-of-line
            zle expand-or-complete
            ;;

        " " )
            BUFFER="!?"
            zle end-of-line
            zle expand-or-complete
            ;;

        * )
            zle expand-or-complete
            ;;
    }
}

zle -N user-complete
bindkey "\t" user-complete
#}}}

#{{{ Misc Settings
# Load functions
autoload -U zmv
autoload -U zrecompile
autoload -U compinit
autoload -U promptinit
# Start functions
compinit
promptinit
# Alias settings
alias history='fc -il 1'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
# FVWM settings
export FVWM_USERDIR=~/.fvwm
#}}}
