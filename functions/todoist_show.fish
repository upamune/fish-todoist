#!/usr/bin/env fish

function todoist_show
  command todoist list | fzf --reverse --header='ShowTask' +m | cut -d ' ' -f 1 | tr '\n' ' ' | read -l tasks
  
  set cmd "command todoist show "
  if [ (string length "$tasks") -ne 0 ]
      set cmd "$cmd""$tasks"
      echo $cmd
      eval $cmd
  end
end
