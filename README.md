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

TODO: Add a short summary of this module.

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

#### p6df-slack/lib

##### p6df-slack/lib/cli.sh

- `p6df::modules::slack::cli::chatdelete(channel, timestamp)`
- `p6df::modules::slack::cli::chatsend(channel, text)`
- `p6df::modules::slack::cli::chatupdate(channel, timestamp, text)`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── cli.sh
├── README.md
└── share
    └── kb-shortcuts.png

3 directories, 4 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
