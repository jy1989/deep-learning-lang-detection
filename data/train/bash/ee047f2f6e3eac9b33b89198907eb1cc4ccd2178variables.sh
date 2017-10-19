# key bindings
default_save_key="C-s"
save_option="@resurrect-save"
save_path_option="@resurrect-save-script-path"

default_restore_key="C-r"
restore_option="@resurrect-restore"
restore_path_option="@resurrect-restore-script-path"

# default processes that are restored
default_proc_list_option="@resurrect-default-processes"
default_proc_list='vi vim nvim emacs man less more tail top htop irssi'

# User defined processes that are restored
#  'false' - nothing is restored
#  ':all:' - all processes are restored
#
# user defined list of programs that are restored:
#  'my_program foo another_program'
restore_processes_option="@resurrect-processes"
restore_processes=""

# Defines part of the user variable. Example usage:
#   set -g @resurrect-strategy-vim "session"
restore_process_strategy_option="@resurrect-strategy-"

inline_strategy_token="->"

save_command_strategy_option="@resurrect-save-command-strategy"
default_save_command_strategy="ps"

bash_history_option="@resurrect-save-bash-history"

# set to 'on' to ensure panes are never ever overwritten
overwrite_option="@resurrect-never-overwrite"