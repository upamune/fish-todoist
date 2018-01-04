#!/usr/bin/env fish

function __todoist_show
  command todoist list | fzf --reverse --header='ShowTask' +m | cut -d ' ' -f 1 | tr '\n' ' ' | read -lz tasks
  
  set cmd "todoist show "
  if not test -z $tasks
      set cmd "$cmd""$tasks"
      echo $cmd
      eval $cmd
  end
end
