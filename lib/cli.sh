# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatdelete(channel, timestamp)
#
#  Args:
#	channel -
#	timestamp -
#
#  Environment:	 SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatdelete() {
  local channel=$1
  local timestamp=$2
  local token=$SLACK_CLI_TOKEN

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
#  Environment:	 SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatsend() {
  local channel=$1
  local text=$2
  local token=$SLACK_CLI_TOKEN

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
#  Environment:	 SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::cli::chatupdate() {
  local channel=$1
  local timestamp=$2
  local text=$3
  local token=$SLACK_CLI_TOKEN

  local msg=$(curl -s -X POST https://slack.com/api/chat.update \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "ts=${timestamp}" \
    --data-urlencode "text=${text}" \
    --data-urlencode "token=${token}")

  p6_echo "$msg" | jq .
}
