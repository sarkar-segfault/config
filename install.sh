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

echo -e "${BLUE}Removing ${HOME}/.bashrc...${END}"
rm -rf "${HOME}/.bashrc"
echo -e "${BLUE}Creating symlink ${HOME}/.bashrc -> $(pwd)/.bashrc...${END}"
ln -s "$(pwd)/.bashrc" "${HOME}/.bashrc"
echo -e "${GREEN}Linked .bashrc!${END}"
