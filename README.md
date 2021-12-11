## Prerequisites

#### MacOS Package Manager
*Brew:*: https://brew.sh
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


#### Shell Plugin Manager
*Antibody:*: https://getantibody.github.io
`brew install antibody` or `curl -sfL git.io/antibody | sh -s - -b /usr/local/bin`


#### Plugins

Fuzzyfinding:
fzf: https://github.com/junegunn/fzf
`brew install fzf && $(brew --prefix)/opt/fzf/install`

RipGrep: https://github.com/BurntSushi/ripgrep#installation
`brew install ripgrep`

Bat: https://github.com/sharkdp/bat
`brew install bat`


Run all with:
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* `brew install antibody ripgrep bat fzf && $(brew --prefix)/opt/fzf/install`
