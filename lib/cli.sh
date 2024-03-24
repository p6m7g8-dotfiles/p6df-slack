# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatdelete(channel, timestamp, token)
#
#  Args:
#	channel -
#	timestamp -
#	token -
#
#  Environment:	 POST SLACK_CLI_TOKEN
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

  p6_echo $msg | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatsend(channel, text, token)
#
#  Args:
#	channel -
#	text -
#	token -
#
#  Environment:	 POST SLACK_CLI_TOKEN
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

  p6_echo $msg | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::cli::chatupdate(channel, timestamp, text, token)
#
#  Args:
#	channel -
#	timestamp -
#	text -
#	token -
#
#  Environment:	 POST SLACK_CLI_TOKEN
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

  p6_echo $msg | jq .
}
