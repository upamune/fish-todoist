#!/usr/bin/env fish

function __todoist_actions
  functions --all | grep '^__todoist_' | grep -v '__todoist_actions' | fzf +m --reverse --header='Todoist:Actions' | read -l cmd; and eval $cmd
end
