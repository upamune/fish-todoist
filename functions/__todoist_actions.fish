#!/usr/bin/env fish

function __todoist_actions
  functions | grep '^__todoist_' | grep -v 'todoist_actions' | fzf +m --reverse --header='Todoist:Actions' | read -l cmd; and eval $cmd
end
