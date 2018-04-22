# DVELP dotfiles

Get your machine purring with this selection of dotfiles.

## Requirements

Use zsh as your default shell:

```
chsh -s $(which zsh)
```

Install [rcm](https://github.com/thoughtbot/rcm):

```
brew tap thoughtbot/formulae
brew install rcm
```

## Installation

```
git clone https://github.com/DVELP/dotfiles.git ~/dotfiles
```

Install the dotfiles with rcm:

```
env RCRC=$HOME/dotfiles/rcrc rcup
```

After the initial installation, you can run rcup without the one-time variable
RCRC being set (rcup will symlink the repo's rcrc to ~/.rcrc for future runs of
rcup). See example.

This command will create symlinks for config files in your home directory.
Setting the RCRC environment variable tells rcup to use standard configuration
options:

* Exclude the README.md and LICENSE files, which are part of the dotfiles
repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
~/dotfiles-local
* Please configure the rcrc file if you'd like to make personal overrides in a
different directory

## Update

You can update your dotfiles by pulling the repo and running:

```
rcup
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/DVELP/dotfiles. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The code is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

<br></br>
[![DVELP
logo](https://raw.githubusercontent.com/DVELP/cookbook/master/assets/dvelp-logo.png
'DVELP logo')](http://dvelp.co.uk)

This repository was created and is maintained by DVELP Ltd.

If you like what you see and would like to hire us or join us, [get in
touch](http://dvelp.co.uk)!
