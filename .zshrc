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

#プロンプト表示する度に変数を展開
setopt prompt_subst

precmd () {
  if [ -n "$(git status --short 2>/dev/null)" ];then
    export GIT_HAS_DIFF="✗"
    export GIT_NON_DIFF=""
  else
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF="✔"
  fi
  # git管理されているか確認
  git status --porcelain >/dev/null 2>&1
  if [ $? -ne 0 ];then
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF=""
  fi
  export BRANCH_NAME=$(git branch --show-current 2>/dev/null)
}

PROMPT="
%F{cyan}%m:%~%f"
PROMPT=${PROMPT}'%F{green} ${BRANCH_NAME} ${GIT_NON_DIFF}%F{red}${GIT_HAS_DIFF}
%f$ '
