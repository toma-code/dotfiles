# カラー表示を有効にする
export CLICOLOR=1
# ディレクトリやファイルの色設定を指定する
export LSCOLORS=GxFxCxDxBxegedabagaced

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{cyan}%~%f %F{white}$(__git_ps1 "(%s)")%f
\$ '
