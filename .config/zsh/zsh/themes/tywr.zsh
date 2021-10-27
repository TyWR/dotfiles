# ----------------------------------------------------------------------------
#                                   PROMPT
# ----------------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[yellow]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
PROMPT_ARROW=" >" 
PS1='
  %{$fg_bold[cyan]%}%3c%{$reset_color%} $(git_prompt_info)
 %{$fg_bold[blue]%}${PROMPT_ARROW} %{$reset_color%}%'
# ----------------------------------------------------------------------------
