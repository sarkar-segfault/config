#!/usr/bin/env bash

export _ZO_DOCTOR=0
eval "$(zoxide init bash)"

export CC=clang
export CXX=clang++
export CMBD=build
alias cgen='cmake -B${CMBD} -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias cbld='cmake --build ${CMBD} --parallel $(nproc)'
alias ccfg='cp ${CMBD}/compile_commands.json .'
alias ctst='ctest --test-dir=${CMBD}'

alias desktop=startx
alias say=espeak-ng
alias fetch="fastfetch -c examples/27"
alias ls="eza --group-directories-first -F -1 -A"
alias less="bat --pager=builtin"
alias matrix="unimatrix -a -s 96 -l o"
alias cat="bat --pager=cat"
alias hx="helix"
alias cd=z

export EDITOR="helix"
export HISTFILE="/dev/null"
export CMAKE_GENERATOR="Ninja"
export BAT_THEME="Catppuccin Mocha"
export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[\e[35m\]\$ \[\e[0m\]"

__just_cleared=0

clear() {
  __just_cleared=1
  command clear
}

PROMPT_COMMAND='
if (( ! __just_cleared )); then
  printf "\n"
fi
__just_cleared=0
'

fetch
