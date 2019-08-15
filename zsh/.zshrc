# ensure needed directories exist
[[ ! -d "${HOME}/.hist" ]] && { mkdir "${HOME}/.hist"; }

export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less

if [[ ${UID} == 0 ]] ; then
	PROMPT="%S%m%s # "
else
	PROMPT="%B%n%b/%B%m%b %# "
fi

export PROMPT
export RPROMPT=" %~"

# select/deselect shell features
setopt \
	NOCORRECT \
	HASH_DIRS \
	NO_BEEP NOTIFY \
	PUSHD_IGNORE_DUPS \
	EXTENDED_GLOB \
	LONG_LIST_JOBS

bindkey -e
WORDCHARS=${WORDCHARS:s#/#}

# setup command history
HISTSIZE=60000
HISTFILE=${HOME}/.hist/${HOST}
SAVEHIST=10000

# quote names for the shell if they contain shell metacharacters or would cause
# ambiguous output
export QUOTING_STYLE=shell

# load supplementary configs if available
[[ -f ${HOME}/.zalias && -r ${HOME}/.zalias ]] && { source ${HOME}/.zalias; }
[[ -f ${HOME}/.zfunc && -r ${HOME}/.zfunc ]] && { source ${HOME}/.zfunc; }

# load fancy stuff if available
[[ -f ${HOME}/.zfancy && -r ${HOME}/.zfancy ]] && { source ${HOME}/.zfancy; }
