# Radu's dotfiles

Global apps, modules, packages, .files, sensible hacker defaults for macOS, Linux and Windows WSL (WIP)

![image](https://user-images.githubusercontent.com/46779/133124073-b13f2779-dc1b-433a-a53e-6db6e105fe29.png)

## Inspiration ❤️🌎

This repo is inspired and influenced by

- Miloš Sutanovac [dotfiles](https://github.com/mixn/dotfiles)
- Carlos Alexandro Becker [dotfiles](https://github.com/caarlos0/dotfiles)

- Mathias Bynens’ [dotfiles](https://github.com/mathiasbynens/dotfiles)
- Zach Holman’s [dotfiles](https://github.com/holman/dotfiles)
- Dries Vints’ [dotfiles](https://github.com/driesvints/dotfiles)
- Lars Kappert’s [dotfiles](https://github.com/webpro/dotfiles)
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
- [Faster ZSH](https://htr3n.github.io/2018/07/faster-zsh/)

A big **thank you** to the dotfiles community and all aforementioned people.

## Install

#### ⚠️ Disclaimer ⚠️

These are **my** dotfiles, so please feel free to take anything you want but do so **at your own risk**. 🙂 You should first fork this repository, review the code, and remove the things you don’t want or need. Don’t blindly use stuff unless you know what that entails.

### Dependencies

First, make sure you have all those things installed:

* `git`: to clone the repo
* `curl`: to download some stuff
* `tar`: to extract downloaded stuff
* `zsh`: to actually run the dotfiles
* `sudo`: some configs may need that

### Clone with Git

#### Mac OS dependency

On a fresh install of macOS, run:

```
# This will ensure all updates are done and the installs the necessary Xcode tools
sudo softwareupdate -i -a
xcode-select --install
```

or if that doesn't work download them from here https://developer.apple.com/download/more/ (Command line tools)

#### ⚠️ Temporary step ZSH install

This is not needed with the latest Macs, as ZSH is the default shell. You can check in System settings / Users / right click on the user and advanced options.

Install zsh manually first and make sure its the default shell, then run the install script.

I think I need to make the setup a 2 step process to install zsh run it and the fire again the install script on those machines that don't have it by default.

---

Clone the repo:

```
# Clone in a `.dotfiles` folder as all scripts will reference it
git clone https://github.com/radum/dotfiles.git ~/.dotfiles
```

Then, run these steps:

```
cd ~/.dotfiles
./scripts/bootstrap
zsh # or just close and open your terminal again.
```

### Fonts

To be able to see al glyphs and still use the font we like we need to patch the font and add the missing glyphs.

This can be done with [Nerd fonts](https://github.com/ryanoasis/nerd-fonts). Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons). Specifically to add a high number of extra glyphs from popular 'iconic fonts' such as Font Awesome ➶, Devicons ➶, Octicons ➶, and others.

Pick the one you like and use it in your terminal.

## Further help

- [Personalize your configs](docs/configuration.md)
- [Understand how it works](docs/philosophy.md)
- [Known bugs](docs/bugs.md)
- [License](LICENSE.md)
- [Apps](docs/apps.md)

## TODO

- [ ] Explore these plugins https://github.com/getantidote/zdotdir/blob/advanced/.zsh_plugins.txt
