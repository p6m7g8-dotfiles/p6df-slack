# shellcheck shell=bash
######################################################################
p6df::modules::slack::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    p6m7g8-dotfiles/p6df-js
  )
}

######################################################################
p6df::modules::slack::mcp() {

  claude mcp add --transport http "claude.ai Slack" "https://mcp.slack.com/mcp"

  p6_return_void
}
######################################################################
p6df::modules::slack::profile::mod() {

  p6_return_words 'slack' '$SLACK_TEAM_ID' '$SLACK_CLI_TOKEN'
}

######################################################################
#<
#
# Function: p6df::modules::slack::deps()
#
#>
######################################################################
#<
#
# Function: words slack $SLACK_TEAM_ID = p6df::modules::slack::profile::mod()
#
#  Returns:
#	words - slack $SLACK_TEAM_ID
#
#  Environment:	 SLACK_TEAM_ID
#>
######################################################################
#<
#
# Function: p6df::modules::slack::mcp()
#
#>
