set -x EDITOR vim
set -x GIT_EDITOR vim

set -x GIT_DUET_GLOBAL true
set -x GIT_DUET_ROTATE_AUTHOR true

set -x GOPATH $HOME/workspace/go
set -x PATH $GOPATH/bin $PATH

switch (uname)
case Darwin
  set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
end

set -x grcplugin_ls -F --color

if status --is-interactive
  if test "$LIGHT_MODE" = "1"
    bash $HOME/.vim/scripts/base16-shell/base16-atelierdune.light.sh
  else
    bash $HOME/.vim/scripts/base16-shell/base16-monokai.dark.sh
  end
end

set -x BOSH_USE_BUNDLER true

set -x NVIM_TUI_ENABLE_TRUE_COLOR 1

function pullify --description 'adds PRs as remotes'
  command git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*';
  command git fetch origin
end

eval (direnv hook fish)
rvm default
