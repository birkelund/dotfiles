OS="`uname | tr A-Z a-z`"
ARCH="`uname -m | sed 's;i.86;x86;'`"

# base
PATH="/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/games:$PATH"

# yarn/npm
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# locals
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/work/local/bin:$PATH"

# gpg
GPG_TTY=$(tty)

# export 'em
export OS ARCH PATH GPG_TTY
