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
# Function: p6df::modules::slack::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::slack::init() {

  p6_path_if "$P6_DFZ_SRC_DIR/rockymadden/slack-cli/src"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::slack::chatdelete(channel, timestamp, token)
#
#  Args:
#	channel -
#	timestamp -
#	token -
#
#  Environment:	 POST SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::chatdelete() {
  local channel=$1
  local timestamp=$2
  local token=$SLACK_CLI_TOKEN

  local msg=$(curl -s -X POST https://slack.com/api/chat.delete \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "ts=${timestamp}" \
    --data-urlencode "token=${token}")

  echo $msg | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::chatsend(channel, text, token)
#
#  Args:
#	channel -
#	text -
#	token -
#
#  Environment:	 POST SLACK_CLI_TOKEN
#>
######################################################################
p6df::modules::slack::chatsend() {
  local channel=$1
  local text=$2
  local token=$SLACK_CLI_TOKEN

  local msg=$(curl -s -X POST https://slack.com/api/chat.postMessage \
    --data-urlencode "as_user=true" \
    --data-urlencode "channel=${channel}" \
    --data-urlencode "text=${text}" \
    --data-urlencode "token=${token}")

  echo $msg | jq .
}

######################################################################
#<
#
# Function: p6df::modules::slack::chatupdate(channel, timestamp, text, token)
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
p6df::modules::slack::chatupdate() {
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

  echo $msg | jq .
}
