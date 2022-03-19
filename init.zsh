
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
# Function: p6df::modules::slack::init()
#
#>
######################################################################
p6df::modules::slack::init() {

  p6_path_if "$P6_DFZ_SRC_DIR/rockymadden/slack-cli/src"
}
