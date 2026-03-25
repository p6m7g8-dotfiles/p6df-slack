# P6's POSIX.2: p6df-slack

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for Slack: CLI tools (`@slack/cli`), profile switching
(`SLACK_BOT_TOKEN` derived from `SLACK_CLI_TOKEN`), and MCP server
(claude.ai marketplace Slack at `https://mcp.slack.com/mcp`) for AI-driven Slack interactions.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-slack

##### p6df-slack/init.zsh

- `p6df::modules::slack::deps()`
- `p6df::modules::slack::init(_module, dir)`
  - Args:
    - _module
    - dir
- `p6df::modules::slack::langs()`
- `p6df::modules::slack::mcp()`
- `p6df::modules::slack::profile::off()`
- `p6df::modules::slack::profile::on(profile, code)`
  - Args:
    - profile
    - code
- `str str = p6df::modules::slack::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
├── README.md
└── share
    └── kb-shortcuts.png

2 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
