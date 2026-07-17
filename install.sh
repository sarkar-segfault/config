#!/usr/bin/env bash
[[ -t 1 ]] && BLUE="\e[34m" || BLUE=""
[[ -t 1 ]] && GREEN="\e[32m" || GREEN=""
[[ -t 1 ]] && END="\e[0m" || END=""

for dir in */; do
  src="$(pwd)/${dir%/}"
  dst="${HOME}/.config/${dir%/}"

  echo -e "${BLUE}Removing ${dst}...${END}"
  rm -rf "${dst}"

  echo -e "${BLUE}Creating symlink ${dst} -> ${src}...${END}"
  ln -s "${src}" "${dst}"

  echo -e "${GREEN}Linked ${dir%/}!${END}"
done

for dot in .bashrc .xinitrc; do
  echo -e "${BLUE}Removing ${HOME}/${dot}...${END}"
  rm -rf "${HOME}/${dot}"
  echo -e "${BLUE}Creating symlink ${HOME}/${dot} -> $(pwd)/${dot}...${END}"
  ln -s "$(pwd)/${dot}" "${HOME}/${dot}"
  echo -e "${GREEN}Linked ${dot}!${END}"
done
