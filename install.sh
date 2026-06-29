[[ -t 1 ]] && BLUE="\e[34m" || BLUE=""
[[ -t 1 ]] && GREEN="\e[32m" || GREEN=""
[[ -t 1 ]] && END="\e[0m" || END=""

for dir in */; do
  CFGDIR="${HOME}/.config/${dir}"

  echo -e "${BLUE}Removing ${CFGDIR}...${END}"
  rm -rf "${HOME}/.config/${dir}"

  echo -e "${BLUE}Copying ${dir} to ${CFGDIR}...${END}"
  cp -r "${dir}" "${HOME}/.config/${dir}"

  echo -e "${GREEN}Configured ${dir}!${END}"
done
