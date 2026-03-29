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

  if p6_string_blank "$profile"; then
    p6_echo "error: profile must be provided" >&2
    return 1
  fi

  if p6_string_blank "${SLACK_CLI_TOKEN:-}"; then
    p6_echo "error: SLACK_CLI_TOKEN must be provided" >&2
    return 1
  fi

  p6_env_export "P6_DFZ_PROFILE_SLACK" "$profile"
  p6_env_export "SLACK_CLI_TOKEN" "${SLACK_CLI_TOKEN:-}"
  p6_env_export "SLACK_BOT_TOKEN" "${SLACK_BOT_TOKEN:-$SLACK_CLI_TOKEN}"

  if p6_string_blank_NOT "${SLACK_APP_TOKEN:-}"; then
    p6_env_export "SLACK_APP_TOKEN" "$SLACK_APP_TOKEN"
  fi

  if p6_string_blank_NOT "${SLACK_TEAM_ID:-}"; then
    p6_env_export "SLACK_TEAM_ID" "$SLACK_TEAM_ID"
  fi

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

  claude mcp add --transport http "claude.ai Slack" "https://mcp.slack.com/mcp"

  p6_return_void
}
