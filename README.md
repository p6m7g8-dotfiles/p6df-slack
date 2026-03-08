# P6's POSIX.2: p6df-slack

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for Slack: CLI tools (`@slack/cli`), profile switching
(`SLACK_BOT_TOKEN` derived from `SLACK_CLI_TOKEN`), and MCP server
(`@modelcontextprotocol/server-slack` via npm) for AI-driven Slack interactions.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `scli` -> `slack`
- `slack-api` -> `$P6_DFZ_SRC_DIR/p6m7g8-dotfiles/p6df-slack/lib/slack-api`

### Functions

#### p6df-slack

##### p6df-slack/init.zsh

- `p6df::modules::slack::aliases::init()`
- `p6df::modules::slack::deps()`
- `p6df::modules::slack::init(_module, dir)`
  - Args:
    - _module
    - dir
- `p6df::modules::slack::langs()`
- `p6df::modules::slack::mcp()`
- `p6df::modules::slack::profile::off()`
- `p6df::modules::slack::profile::on(profile, env_or_cli_token, [app_token=], [team_id=])`
  - Args:
    - profile
    - env_or_cli_token
    - OPTIONAL app_token - []
    - OPTIONAL team_id - []
- `str str = p6df::modules::slack::prompt::mod()`

#### p6df-slack/lib

##### p6df-slack/lib/cli.sh

- `p6df::modules::slack::cli::api(method, [json_payload={}])`
  - Args:
    - method
    - OPTIONAL json_payload - [{}]
- `p6df::modules::slack::cli::chatdelete(channel, timestamp)`
  - Args:
    - channel
    - timestamp
- `p6df::modules::slack::cli::chatsend(channel, text)`
  - Args:
    - channel
    - text
- `p6df::modules::slack::cli::chatupdate(channel, timestamp, text)`
  - Args:
    - channel
    - timestamp
    - text
- `str token = p6df::modules::slack::cli::token()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   ├── cli.sh
│   └── slack-api
├── README.md
└── share
    └── kb-shortcuts.png

3 directories, 5 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
