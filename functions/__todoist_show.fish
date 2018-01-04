#!/usr/bin/env fish

function __todoist_show
  todoist list | fzf --reverse --header='ShowTask' +m | cut -d ' ' -f 1 | tr '\n' ' ' | read -l tasks
  
  set cmd "todoist show "
  if [ (string length "$tasks") -ne 0 ]
      set cmd "$cmd""$tasks"
      echo $cmd
      eval $cmd
  end
end
