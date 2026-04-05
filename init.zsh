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
    p6m7g8-dotfiles/p6df-js
  )
}

######################################################################
#<
#
# Function: p6df::modules::slack::mcp()
#
#>
######################################################################
p6df::modules::slack::mcp() {

  claude mcp add --transport http "claude.ai Slack" "https://mcp.slack.com/mcp"

  p6_return_void
}
######################################################################
#<
#
# Function: words slack = p6df::modules::slack::profile::mod()
#
#  Returns:
#	words - slack
#
#  Environment:	 SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::profile::mod() {

  p6_return_words 'slack' '$SLACK_TEAM_ID' '$SLACK_CLI_TOKEN'
}

