# ------------------------------------------------------------------------------
# ZSH Configuration
# ------------------------------------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

# ZSH Options
# https://zsh.sourceforge.io/Doc/Release/Options.html

# If command is invalid but is a directory, cd to it
setopt autocd

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation, etc. (An initial unquoted ‘~’ always produces named
# directory expansion.)
# setopt extendedglob

# If a pattern for filename generation has no matches, print an error,
# instead of leaving it unchanged in the argument list. This also applies
# to file expansion of an initial ‘~’ or ‘=’.
setopt nomatch

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups

# Stop error notification beep
unsetopt beep notify

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
ZSH=~/.config/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"


# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	sudo

	# zsh-syntax-highlighting
	fast-syntax-highlighting
	zsh-history-substring-search
	zsh-autosuggestions
	# zsh-autocomplete

	# archlinux
	# common-aliases

	zsh-interactive-cd
	dirhistory
	z

	cp
	# git
)


# ------------------------------------------------------------------------------
# Oh My Zsh configuration
# ------------------------------------------------------------------------------
# ZSH Cache directory
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir $ZSH_CACHE_DIR
fi

# ZSH Custom directory
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ------------------------------------------------------------------------------
# User variables
# ------------------------------------------------------------------------------
LS='gls'
# LS='lsd'

NANO="/opt/homebrew/bin/nano"

# Set default editor based on SSH connection
if [[ -n $SSH_CONNECTION ]]; then
	EDITOR=$NANO
else
	EDITOR=$NANO
fi

SSH_KEY_PATH="~/.ssh/rsa_id"


# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

alias mkdir="mkdir -p"

# File listing
alias ls='$LS --color -h --group-directories-first'

alias ll='$LS       --color --group-directories-first -lFh'         # long list, no dotfiles
alias la='$LS       --color --group-directories-first -AlFh'        # long list, show almost all, show type, human readable
alias ldot='$LS     --color --group-directories-first -ldh .*'      # list dot files
alias llc='$LS      --color --group-directories-first -1'           # A column contains name of files and directories
alias lac='$LS      --color --group-directories-first -1A'          # A column contains name of files and directories + hidden files
alias ldotc='$LS    --color --group-directories-first -1d .*'       # A column contains name of files and directories only hidden files
alias llt='$LS      --color --group-directories-first -lFht'        # long list, no dotfiles, sorted by date
alias lat='$LS      --color --group-directories-first -AlFht'       # long list, show almost all, show type, human readable, sorted by date
alias ldott='$LS    --color --group-directories-first -ldht .*'     # list dot files, sorted by date

# Command line head / tail shortcuts
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g M="| most"
# alias -g LL="2>&1 | less"
# alias -g CA="2>&1 | cat -A"
# alias -g NE="2> /dev/null"
# alias -g NUL="> /dev/null 2>&1"
# alias -g P="2>&1| pygmentize -l pytb"

# ZSH Config editors
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias czshrc='code ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias zsh-reload='source ~/.zshrc'

# Kitty Config editors
# alias kittyconf='${=EDITOR} ${ZDOTDIR:-$HOME}/.config/kitty/kitty.conf' # Quick access to the .zshrc file

# Grep aliases
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# File size
alias dud='du -d 1 -h'
(( $+commands[duf] )) || alias duf='du -sh *'
(( $+commands[fd] )) || alias fd='find . -type d -name'

# Find files
alias ff='find . -type f -name'

# Terminal history
alias h='history'
alias hgrep="fc -El 0 | grep"

# Miscellaneous
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'


# Arch Linux shortcuts
# alias yayy="yay --noconfirm"
# alias yayr="yay -Rnsu"
# alias yayrf="yay -Rnsudd"
# alias saveForWeb="mogrify -format jpg -resize 1920x1280 *.jpg; jpegoptim -S400 -w8 -sq *.jpg"
# alias mpv="mpv --no-config --hwdec=yes --vo=gpu-next --target-colorspace-hint --gpu-context=waylandvk --gpu-api=vulkan --hdr-compute-peak=no --framedrop=no"

# UART Print tool
#alias uart-print="stty -F /dev/ttyUSB0 406:0:18b2:8a30:3:1c:7f:15:4:2:64:0:11:13:1a:0:12:f:17:16:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0 && stdbuf -o0 cat /dev/ttyUSB0"
#alias uart-print-log="stty -F /dev/ttyUSB0 406:0:18b2:8a30:3:1c:7f:15:4:2:64:0:11:13:1a:0:12:f:17:16:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0 && stdbuf -o0 cat /dev/ttyUSB0 | tee received.log"
# uart_print() {
# 	DEVICE=/dev/ttyUSB0
# 	if [ $# -eq 1 ]
# 	then
# 		DEVICE=$1
# 	fi

# 	stty -F $DEVICE 406:0:18b2:8a30:3:1c:7f:15:4:2:64:0:11:13:1a:0:12:f:17:16:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0
# 	stdbuf -o0 cat $DEVICE
# }


# MacOS shortcuts
alias nano='$NANO'

# MacOS Dock spacers
alias tf-macos-dock-large-spacer='defaults write com.apple.dock persistent-apps -array-add "{tile-data={}; tile-type=\"spacer-tile\";}" && killall Dock'
alias tf-macos-dock-small-spacer='defaults write com.apple.dock persistent-apps -array-add "{\"tile-type\"=\"small-spacer-tile\";}" && killall Dock'
