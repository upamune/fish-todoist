#!/usr/bin/env fish

function __todoist_add
  get --prompt="Enter a task name:> " | read -l task
  seq 4 | fzf --reverse --header='AddTask:Priority' | read -l priority
  command todoist labels | fzf --reverse --header='AddTask:Label' -m | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//' | read -l labels
  command todoist projects | fzf --reverse --header='AddTask:Project' | head -n1 | cut -d ' ' -f 1 | read -l project
  set date_str 'today'
  
  set -l cmd 'todoist add '
  
  if [ (string length "$priority") -eq 1 ]
      set cmd "$cmd""--priority $priority "
  end
  
  if [ (string length "$labels") -ne 0 ]
      set cmd "$cmd""--label-ids $labels "
  end
  
  if [ (string length "$project") -ne 0 ]
      set cmd "$cmd""--project-id $project "
  end
  
  if [ (string length "$date_str") -ne 0 ]
      set cmd "$cmd""--date $date_str "
  end
  
  set cmd "$cmd""\"$task\""
  
  echo $cmd
  eval $cmd 
end