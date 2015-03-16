# name: Jacaetevha
function fish_prompt

  # workaround for the fish_function_path pointing to /usr/ not to /opt/
  if functions -q __fish_git_prompt
 	 echo "__fish_git_prompt exists"
  else
 	 echo "__fish_git_prompt doesn't exist"
     set -U -e fish_function_path ; exec fish
  end

  set_color yellow
  printf '%s' (whoami)
  set_color normal
  printf '@'

  set_color magenta
  printf '%s' (hostname|cut -d . -f 1)
  set_color normal
  printf ':'

  set_color $fish_color_cwd
  printf '%s' (basename (prompt_pwd))
  set_color red
  printf '%s' (__fish_git_prompt)
  set_color normal

  # Line 2
  echo
  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '↪  '
  set_color normal
end

