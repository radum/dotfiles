# Radu's dotfiles

Global apps, modules, packages, .files, sensible hacker defaults for macOS and Windows

## Inspiration ❤️🌎

This repo is inspired and influenced by

- Miloš Sutanovac [dotfiles](https://github.com/mixn/dotfiles)
- Mathias Bynens’ [dotfiles](https://github.com/mathiasbynens/dotfiles)
- Zach Holman’s [dotfiles](https://github.com/holman/dotfiles)
- Dries Vints’ [dotfiles](https://github.com/driesvints/dotfiles)
- Lars Kappert’s [dotfiles](https://github.com/webpro/dotfiles)
- Carlos Alexandro Becker’s [dotfiles](https://github.com/caarlos0/dotfiles)
- Paul Irish’s [dotfiles](https://github.com/paulirish/dotfiles)
- Ivan Santos’s [dotfiles](https://github.com/pragmaticivan/dotfiles)
- Alexander Myshov’s [dotfiles](https://github.com/myshov/dotfiles)
- Eduardo Rabelo’s [dotfiles](https://github.com/oieduardorabelo/dotfiles)
- Ryan Tomayko’s [dotfiles](https://github.com/rtomayko/dotfiles)

Other inspiring and quite helpful articles, repos, tools, etc.:

- [Dotfiles Are Meant to Be Forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
- [Getting Started With Dotfiles (Lars Kappert)](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
- [Getting Started with Dotfiles (Dries Vints)](http://sourabhbajaj.com/mac-setup/)
- [Shell Startup Scripts](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
- [macOS Setup Guide](http://sourabhbajaj.com/mac-setup/)
- [Github does Dotfiles](https://dotfiles.github.io/)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Awesome Shell](https://github.com/alebcay/awesome-shell)
- [Awesome UNIX®](https://github.com/sirredbeard/Awesome-UNIX)

A big **thank you** to the dotfiles community and all aforementioned people.

## Install

#### ⚠️ Disclaimer ⚠️

These are **my** dotfiles, so please feel free to take anything you want but do so **at your own risk**. 🙂 You should first fork this repository, review the code, and remove the things you don’t want or need. Don’t blindly use stuff unless you know what that entails.

#### Clone with Git

On a fresh install of macOS, run:

```
# This will ensure all updates are done and the installs the necessary Xcode tools
sudo softwareupdate -i -a
xcode-select --install
```

Then clone the repo:

```
# Clone in a `.dotfiles` folder as all scripts will reference it
git clone https://github.com/radum/dotfiles.git ~/.dotfiles
```

Update the `git/extra.sh` file that looks like this:

```
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Radu Micu"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="radu.micu@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

And run `scripts/install.sh`:

```
source ~/.dotfiles/scripts/install.sh
```
