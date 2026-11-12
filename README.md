# Homebrew tap for Uzumaki

[Uzumaki](https://getuzumaki.app) is a native desktop client for Apple Music.
This tap installs the macOS app (Apple silicon, macOS 13 Ventura or later) and the `uzu` command.

## Install

```sh
brew install --cask hanami117/uzumaki/uzumaki
```

That command adds the tap and marks the cask as trusted. Homebrew 7 and later loads casks from other taps only when they are trusted.
If you add the tap with `brew tap hanami117/uzumaki` instead, run `brew trust --cask hanami117/uzumaki/uzumaki` before `brew install --cask uzumaki`.

### First launch

Uzumaki is signed ad hoc and is not notarized, so macOS refuses the first launch.
Open **System Settings → Privacy & Security** and click **Open Anyway**. You need to do this only once.
Or run this command before you launch the app:

```sh
xattr -dr com.apple.quarantine /Applications/Uzumaki.app
```

## Upgrade

```sh
brew update
brew upgrade --cask uzumaki
```

The app tells you when a new version is out. It does not update itself.

## Uninstall

```sh
brew uninstall --cask uzumaki
```

This removes the app and `uzu`. Your sign-in and settings stay on the Mac.
To remove them too:

```sh
brew uninstall --zap --cask uzumaki
```

The sign-in also leaves a "Safe Storage" item in Keychain Access. You can delete it there.

## Problems

Report problems with the app at https://github.com/hanami117/uzumaki/issues.
