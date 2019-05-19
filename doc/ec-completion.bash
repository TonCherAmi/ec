_ec() {
  cur="${COMP_WORDS[COMP_CWORD]}"

  COMPREPLY=($(compgen -W "$(ec -l)" -- "$cur"))
}

complete -F _ec ec
