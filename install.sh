for dir in */; do
  CFGDIR="${HOME}/.config/${dir}"

  echo "Removed ${CFGDIR}"
  rm -rf "${HOME}/.config/${dir}"

  echo "Copying ${dir} to ${CFGDIR}"
  cp -r "${dir}" "${HOME}/.config/${dir}"
done
