<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Radu's dotfiles](#radus-dotfiles)
	- [Dev](#dev)
		- [All platforms](#all-platforms)
		- [Browsers](#browsers)
		- [Code editors](#code-editors)
		- [DB Tools, Editors, Viewers, Etc](#db-tools-editors-viewers-etc)
		- [GIT GUI](#git-gui)
		- [Font Management](#font-management)
		- [Mac](#mac)
			- [Paid apps](#paid-apps)
			- [Via Homebrew](#via-homebrew)
			- [Shell](#shell)
				- [Themes and skins](#themes-and-skins)
					- [ZSH](#zsh)
					- [# TMUX](#-tmux)
					- [iTerm2 Color Scheme](#iterm2-color-scheme)
				- [Plugins](#plugins)
				- [Dependencies](#dependencies)
		- [Windows](#windows)
			- [Visual C++ Build Tools](#visual-c-build-tools)
			- [PowerShell](#powershell)
			- [Windows ENV variables](#windows-env-variables)

<!-- /TOC -->

# Radu's dotfiles

Global apps, modules, packages, .files, sensible hacker defaults for macOS and Windows

## Dev

Dev software that I install and keep updated manually on every machine

### All platforms

* Node.js - https://nodejs.org/ (Install via https://github.com/creationix/nvm for Mac)
* Go lang - https://golang.org/
* Python - https://www.python.org/ (2.7.x)
* Composer for PHP - https://getcomposer.org/
* Docker - https://www.docker.com/products/docker-toolbox
	* Docker management UI - http://portainer.io/
* Vagrant - https://www.vagrantup.com/

* Virtualbox - https://www.virtualbox.org/
* Hyper - https://hyper.is/

* **Pandoc** A universal document converter - http://pandoc.org/
* **CSV Toolkit** - http://csvkit.readthedocs.org/en/0.9.1/
* **Charlesproxy** - https://www.charlesproxy.com/
* **Fiddler** - https://www.telerik.com/download/fiddler/fiddler-osx-beta
* **Postman** - https://www.getpostman.com/
* **Licecap** Make GIFs - http://www.cockos.com/licecap/
* **Glances** Glances an Eye on your system - https://github.com/nicolargo/glances
* **Highlight** Highlight converts sourcecode to HTML, RTF, LaTeX, etc - http://www.andre-simon.de/doku/highlight/en/highlight.php
* **httpie** - https://github.com/jakubroztocil/httpie
* **Remotedebug iOS** - https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter
* **xnconvert** batch image processing -  https://www.xnview.com/en/xnconvert/

### Browsers

* **Blisk** Chromium-based browser - https://blisk.io/

### Code editors

* Atom - https://atom.io/
	* [Configuration, themes, plugins](.atom/README.md)
* Sublime Text 3 - http://www.sublimetext.com/3
* Notepad++ - https://notepad-plus-plus.org/

### DB Tools, Editors, Viewers, Etc

* **Robomongo** - http://robomongo.org/
* **Redisdesktop** - http://redisdesktop.com/
* **SQLite Browser** - http://sqlitebrowser.org/
* **Cyberduck** Cyberduck is a libre FTP, SFTP, etc browser - https://cyberduck.io/

### GIT GUI

* Github - https://desktop.github.com/
* Sourcetree - https://www.sourcetreeapp.com/

### Font Management, Fonts

* FontBase - http://fontba.se/
* FontForge - https://github.com/fontforge/fontforge

* https://github.com/tonsky/FiraCode
* https://github.com/source-foundry/Hack
* https://github.com/adobe-fonts/source-code-pro

### Mac

* *Node.js Mac settings* - https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
* *Homebrew* - http://brew.sh/
* *Cakebrew* The Mac App for Homebrew - https://www.cakebrew.com/
* *Brew Cask* - http://caskroom.io/
* *Ruby* via Ruby version manager - https://rvm.io/ (Ruby gems [ruby-gems.sh](ruby-gems.sh))
* *iTerm2* - https://www.iterm2.com/
* *Alfred App 2* - https://www.alfredapp.com/
* *Spectacle App* - https://www.spectacleapp.com/
* *Mac-cli* - https://github.com/guarinogabriel/mac-cli
* *Gas Mask* Gas Mask is simple hosts file manager for Mac OS X - https://github.com/2ndalpha/gasmask

* Commander One - http://mac.eltima.com/pro-file-manager.html
* Amphetamine - https://itunes.apple.com/gb/app/amphetamine/id937984704?mt=12
* CheatSheet - http://www.mediaatelier.com/CheatSheet/
* Helium - http://jadengeller.github.io/Helium/
* The unarchiver - http://unarchiver.c3.cx/
* Sip - http://theolabrothers.com/
* Dash - https://kapeli.com/dash
* GIF Brewery - http://gifbrewery.com/
* Gifgrabber - http://www.gifgrabber.com/
* GIPHY CAPTURE. The GIF Maker - https://giphy.com/apps/giphycapture
* gifrocket - http://www.gifrocket.com/
* Bettersnaptool - http://www.boastr.net/bettersnaptool/
* Android File transfer - https://www.android.com/filetransfer/
* Smart calculator - http://numi.io/
* Torrent Client - http://www.transmissionbt.com/
* GitUp (git client) - http://gitup.co/
* Funter (show hide hidden files in Finder) - https://nektony.com/products/funter
* Mac-cli - https://github.com/guarinogabriel/mac-cli
* smartapp (keep track of 3G/4G, Wi-Fi, Roaming & Calling usages) - https://getsmartapp.com/
* nvALT (Epic note taking app) - http://brettterpstra.com/projects/nvalt/
* Fluor (Auto change the behaviour of the keyboard's fn keys depending on the active application) - https://github.com/Pyroh/Fluor
* HandBrake (HandBrake is a tool for converting videos) - https://handbrake.fr/
* SecurityGrowler - https://github.com/pirate/security-growler
* PrivateEye - https://radiosilenceapp.com/private-eye

#### Paid apps

* Hemingboard - https://hemingboard.com/
* Radio Silence - https://radiosilenceapp.com/
* LittleSnitch - https://www.obdev.at/products/littlesnitch/index.html

#### Via Homebrew

Complete list in [brew.sh](brew.sh)

* ios-webkit-debug-proxy - https://github.com/google/ios-webkit-debug-proxy
* autojump - https://github.com/wting/autojump (Mac, Windows, Linux)

#### Shell

- https://github.com/robbyrussell/oh-my-zsh
- https://github.com/sorin-ionescu/prezto (Consider using this)

##### Themes and skins

###### ZSH

- Bullet Train - https://github.com/caiogondim/bullet-train-oh-my-zsh-theme

###### TMUX

- https://github.com/caiogondim/maglev

###### iTerm2 Color Scheme

- https://github.com/YabataDesign/afterglow-itermcolors
- https://github.com/mhartington/oceanic-next-iterm

##### Plugins

- https://github.com/zsh-users/zsh-syntax-highlighting/
- https://github.com/zsh-users/zsh-autosuggestions
- https://github.com/felixr/docker-zsh-completion
- https://github.com/paulirish/git-open

##### Dependencies

- https://github.com/Lokaltog/vim-powerline

### Windows

* **Microsoft Visual C++ Compiler for Python 2.7** - http://aka.ms/vcpython27
* **Ruby** - http://rubyinstaller.org/ (Ruby gems [ruby-gems.sh](ruby-gems.sh))
* **Git** - https://git-scm.com/ / https://github.com/git-for-windows/git
* **Conemu** - http://conemu.github.io/ or Cmder http://cmder.net/
* **Clink** - http://mridgers.github.io/clink/
* **Rapidee** Rapid Environment Editor - http://www.rapidee.com/en/download
* **ShareX** Screen grabs beyond everything you can imagine - https://getsharex.com/
* **Psget** Search and install PowerShell modules easy - http://psget.net/
* **Chocolatey** The package manager for Windows - https://chocolatey.org/
 * Complete list of choco packages in [choco.ps1](choco.ps1)

### Bash on Ubuntu on Windows

How to install and use - https://msdn.microsoft.com/en-us/commandline/wsl/about

Articles:

- http://daverupert.com/2017/03/my-bash-on-windows-developer-environment/
- https://www.howtogeek.com/258518/how-to-use-zsh-or-another-shell-in-windows-10/
- https://github.com/Microsoft/WSL/issues/1890#issuecomment-339952407 (Remove windows path. NPM clashes with Win NPM)
- https://msdn.microsoft.com/en-us/commandline/wsl/wsl-config

- https://evalcode.com/zsh-default-wsl-windows-10/

```
# Setup bash common stuff to begin with

cp /path/to/my/key/id_rsa ~/.ssh/id_rsa
cp /path/to/my/key/id_rsa.pub ~/.ssh/id_rsa.pub

chmod 700 ~/.ssh && chmod 600 ~/.ssh/*
```

#### Visual C++ Build Tools
* **Visual C++ Build Tools** - http://landinghub.visualstudio.com/visual-cpp-build-tools

or

* **Visual Studio 2015 Community Edition** - https://www.visualstudio.com/products/visual-studio-community-vs

For Node.js - https://github.com/Microsoft/nodejs-guidelines

#### PowerShell
* posh-git via PsGet - http://psget.net/directory/posh-git/
- PSReadLine - https://github.com/lzybkr/PSReadLine

#### Windows ENV variables

```
GOPATH = d:\dev\Projects\go\
GOROOT = D:\dev\Go\
GYP_MSVS_VERSION = 2015
MSVS_VERSION = 2015
PYTHON = c:\Python27\python.exe
```

### Linux

* https://nixos.org/nix/
