# shellcheck shell=bash
######################################################################
#<
#
# Function: str str = p6df::modules::slack::cli::token()
#
#  Returns:
#	str - str
#
#  Environment:	 SLACK_BOT_TOKEN SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::token() {
  local token="${SLACK_BOT_TOKEN:-$SLACK_CLI_TOKEN}"
  p6_return_str "$token"
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::api(method, [json_payload={}])
#
#  Args:
#	method -
#	json_payload -
#
#  Environment:	 SLACK_BOT_TOKEN SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::api() {
  local method="$1"
  local json_payload="${2:-{}}"
  local token
  token="$(p6df::modules::slack::cli::token)"

  if [ -z "${method//[[:space:]]/}" ]; then
    p6_echo "error: slack api method must be provided (e.g. 'chat.postMessage')" >&2
    return 1
  fi

  if [ -z "${token//[[:space:]]/}" ]; then
    p6_echo "error: slack token is not set; please export SLACK_BOT_TOKEN or SLACK_CLI_TOKEN" >&2
    return 1
  fi

  curl -sS -X POST "https://slack.com/api/${method}" \
    -H "Authorization: Bearer ${token}" \
    -H "Content-Type: application/json; charset=utf-8" \
    --data-raw "$json_payload" | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatdelete(channel, timestamp)
#
#  Args:
#	channel -
#	timestamp -
#
#  Environment:	 SLACK_BOT_TOKEN SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatdelete() {
  local channel=$1
  local timestamp=$2
  local token
  token="$(p6df::modules::slack::cli::token)"

  local msg=$(curl -s -X POST https://slack.com/api/chat.delete \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "ts=${timestamp}" \
    --data-urlencode "token=${token}")

  p6_echo "$msg" | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatsend(channel, text)
#
#  Args:
#	channel -
#	text -
#
#  Environment:	 SLACK_BOT_TOKEN SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatsend() {
  local channel=$1
  local text=$2
  local token
  token="$(p6df::modules::slack::cli::token)"

  local msg=$(curl -s -X POST https://slack.com/api/chat.postMessage \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "text=${text}" \
    --data-urlencode "token=${token}")

  p6_echo "$msg" | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatupdate(channel, timestamp, text)
#
#  Args:
#	channel -
#	timestamp -
#	text -
#
#  Environment:	 SLACK_BOT_TOKEN SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatupdate() {
  local channel=$1
  local timestamp=$2
  local text=$3
  local token
  token="$(p6df::modules::slack::cli::token)"

  local msg=$(curl -s -X POST https://slack.com/api/chat.update \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "ts=${timestamp}" \
    --data-urlencode "text=${text}" \
    --data-urlencode "token=${token}")

  p6_echo "$msg" | jq .
}
