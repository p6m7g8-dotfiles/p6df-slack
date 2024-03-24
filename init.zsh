# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::slack::deps()
#
#>
######################################################################
p6df::modules::slack::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    rockymadden/slack-cli
  )
}

######################################################################
#<
#
# Function: p6df::modules::slack::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::slack::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_path_if "$P6_DFZ_SRC_DIR/rockymadden/slack-cli/src"

  p6_return_void
}
