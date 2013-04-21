# Homebrew Tap

This is used to install OneHealth Formulas that are not distributed by homebrew.
For information on homebrew itself see http://brew.sh/

To use the formulas specified here, use the tap subcommand to pull them in.

```
  $ brew tap onehealth/homebrew-tap
```

If you no longer want to track this repo, use

```
  $ brew untap onehealth/homebrew-tap
```

This repository also contains some experimental /Application installations supported via [homebrew-cask](https://github.com/phinze/homebrew-cask/). For example to install Oracle Virtualbox for use with Vagrant you can use the following

```
  $ brew install brew-cask
  $ brew cask install virtualbox
```

However, keep in mind that this installs a pkg, that still needs to be run manually. See [#14 Support pkg installers](https://github.com/phinze/homebrew-cask/issues/14)

