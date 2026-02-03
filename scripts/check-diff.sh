#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
home_dir=${HOME:?"HOME is not set"}

mappings=(
  ".bashrc:${home_dir}/.bashrc"
  ".condarc:${home_dir}/.condarc"
  ".ideavimrc:${home_dir}/.ideavimrc"
  ".tmux.conf:${home_dir}/.tmux.conf"
  ".vimrc:${home_dir}/.vimrc"
  ".zshrc:${home_dir}/.zshrc"
  "kitty:${home_dir}/.config/kitty"
)

status=0

for mapping in "${mappings[@]}"; do
  repo_rel=${mapping%%:*}
  target_path=${mapping#*:}
  repo_path="${repo_root}/${repo_rel}"

  printf '\n================--- %s -> %s ---================\n' "${repo_rel}" "${target_path}"

  if [[ ! -e "${repo_path}" ]]; then
    printf 'repo missing: %s\n' "${repo_path}" >&2
    status=1
    continue
  fi

  if [[ ! -e "${target_path}" ]]; then
    printf 'target missing: %s\n' "${target_path}" >&2
    status=1
    continue
  fi

  if [[ -d "${repo_path}" ]]; then
    if diff -ru --exclude=.git -- "${repo_path}" "${target_path}"; then
      printf 'no diff\n'
    else
      status=1
    fi
  else
    if diff -u -- "${repo_path}" "${target_path}"; then
      printf 'no diff\n'
    else
      status=1
    fi
  fi
done

exit "${status}"
