# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}●%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{%F{green}●%{%f%k%b%}%}"

PROMPT='%{%f%k%b
%F{green}%n%F{blue}@%F{cyan}%m%B%F{green} %F{yellow}%~%F{green}$(git_prompt_info)%E%f%k%b
%}$(_prompt_char)%#$reset '

RPROMPT='!%B%F{cyan}%!%f%k%b%'
