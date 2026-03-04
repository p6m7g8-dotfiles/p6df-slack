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
#  Environment:	 P6_DFZ_SRC_DIR
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
# Function: p6df::modules::slack::profile::on(profile, env_or_cli_token, [app_token], [team_id])
#
#  Args:
#	profile -
#	env_or_cli_token -
#	OPTIONAL app_token -
#	OPTIONAL team_id -
#
#  Environment:	 P6_DFZ_PROFILE_SLACK SLACK_APP_TOKEN SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::profile::on() {
  local profile="$1"
  local env_or_cli_token="$2"
  local app_token="${3:-}"
  local team_id="${4:-}"

  local cli_token="$env_or_cli_token"

  if p6_string_match_regex "$env_or_cli_token" '(^|[[:space:]])export[[:space:]]+SLACK'; then
    p6_run_code "$env_or_cli_token"
    cli_token="${SLACK_CLI_TOKEN:-}"
    app_token="${SLACK_APP_TOKEN:-$app_token}"
    team_id="${SLACK_TEAM_ID:-$team_id}"
  fi

  if p6_string_blank "$profile"; then
    p6_echo "error: profile must be provided" >&2
    return 1
  fi

  if p6_string_blank "$cli_token"; then
    p6_echo "error: SLACK_CLI_TOKEN must be provided" >&2
    return 1
  fi

  p6_env_export "P6_DFZ_PROFILE_SLACK" "$profile"
  p6_env_export "SLACK_CLI_TOKEN" "$cli_token"

  if p6_string_blank_NOT "$app_token"; then
    p6_env_export "SLACK_APP_TOKEN" "$app_token"
  fi

  if p6_string_blank_NOT "$team_id"; then
    p6_env_export "SLACK_TEAM_ID" "$team_id"
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_SLACK SLACK_APP_TOKEN SLACK_CLI_TOKEN SLACK_TEAM_ID
#>
######################################################################
p6df::modules::slack::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_SLACK
  p6_env_export_un SLACK_CLI_TOKEN
  p6_env_export_un SLACK_APP_TOKEN
  p6_env_export_un SLACK_TEAM_ID

  p6_return_void
}
