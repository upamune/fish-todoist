#!/usr/bin/env fish

function __todoist_add
  get --prompt="Enter a task name:> " | read -lz task
  seq 4 | fzf --reverse --header='AddTask:Priority' | read -lz priority
  command todoist labels | fzf --reverse --header='AddTask:Label' -m | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//' | read -lz labels
  command todoist projects | fzf --reverse --header='AddTask:Project' | head -n1 | cut -d ' ' -f 1 | read -lz project
  set date_str 'today'
  
  set -l cmd 'todoist add '

  if not test -z $priority
      set cmd "$cmd""--priority $priority "
  end
  
  if not test -z $labels
      set cmd "$cmd""--label-ids $labels "
  end
  
  if not test -z $project
      set cmd "$cmd""--project-id $project "
  end
  
  if not test -z $date_str
      set cmd "$cmd""--date $date_str "
  end
  
  set cmd "$cmd""\"$task\""
  
  echo $cmd
  eval $cmd 
end