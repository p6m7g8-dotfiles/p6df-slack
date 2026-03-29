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
# Function: p6df::modules::slack::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::slack::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::langs()
#
#>
######################################################################
p6df::modules::slack::langs() {

  p6_js_npm_global_install "@slack/cli"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::aliases::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::slack::aliases::init() {

  p6_alias "scli" "slack"
  p6_alias "slack-api" "$P6_DFZ_SRC_DIR/p6m7g8-dotfiles/p6df-slack/lib/slack-api"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::slack::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_DFZ_PROFILE_SLACK SLACK_APP_TOKEN SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::prompt::mod() {
  local str

  if p6_string_blank_NOT "$P6_DFZ_PROFILE_SLACK"; then
    str="slack:\t\t  $P6_DFZ_PROFILE_SLACK:"

    if p6_string_blank_NOT "$SLACK_TEAM_ID"; then
      str=$(p6_string_append "$str" "$SLACK_TEAM_ID" " ")
    fi
    if p6_string_blank_NOT "$SLACK_CLI_TOKEN"; then
      str=$(p6_string_append "$str" "cli" "/")
    fi
    if p6_string_blank_NOT "$SLACK_APP_TOKEN"; then
      str=$(p6_string_append "$str" "app" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::slack::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export SLACK_CLI_TOKEN=... SLACK_BOT_TOKEN=... SLACK_APP_TOKEN=... SLACK_TEAM_ID=...)
#
#  Environment:	 P6_DFZ_PROFILE_SLACK SLACK_APP_TOKEN SLACK_BOT_TOKEN SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_SLACK" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 P6_DFZ_PROFILE_SLACK SLACK_APP_TOKEN SLACK_BOT_TOKEN SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_SLACK
  p6_env_export_un SLACK_BOT_TOKEN  # derived from SLACK_CLI_TOKEN

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::mcp()
#
#>
######################################################################
p6df::modules::slack::mcp() {

  p6_js_npm_global_install "@modelcontextprotocol/server-slack"

  p6df::modules::anthropic::mcp::server::add "slack" "npx" "-y" "@modelcontextprotocol/server-slack"
  p6df::modules::openai::mcp::server::add "slack" "npx" "-y" "@modelcontextprotocol/server-slack"

  p6_return_void
}
