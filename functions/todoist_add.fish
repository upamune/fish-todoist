#!/usr/bin/env fish

#   --priority value, -p value    priority (1-4) (default: 1)
#   --label-ids value, -L value   label ids (separated by ,)
#   --project-id value, -P value  project id (default: 0)
#   --date value, -d value        date string (today, 2016/10/02, 2016/09/02 18:00)

seq 4 | fzf --reverse --header='AddTask:Priority' | read priority
todoist labels | fzf --reverse --header='AddTask:Label' -m | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//' | read labels
todoist projects | fzf --reverse --header='AddTask:Project' | head -n1 | cut -d ' ' -f 1 | read project
set date_str 'today'

set cmd 'todoist add '

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

set cmd "$cmd""\"$argv\""

echo $cmd
eval $cmd 
