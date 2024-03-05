# PHILOSOPHY

> Philosophical stuff about this dotfiles structure, decisions, etc..

## Why?

Because I used to spin new machines quite often at one point and I always personalized them manually.

Then I dicovered .dotfiles and the world around them.

## Decisions

## Do not install a lot of software

At first, this repo contained the homebrew installation and other stuff like that. I realized it would be better to split that into another repo, so this one would contain only the configs, and the other handles only software installation.

This is a WIP for now, but at least brew apps have been now separated into 3 files.

* `Brewfile.sh` - Main dependencies for the good work of my dotfiles (bare minimum)
* `BrewfileExtra.sh` - Extra tools I use most times
* `BrewfileMacOS.sh` - Only specific Mac tools

Run the other 2 files only when needed.

### Default `EDITOR`, `VEDITOR` and `PROJECTS`

`VEDITOR` stands for "visual editor", and is set to `code` be default. `EDITOR`
is set to `vim`.

`PROJECTS` is default to `~/personal/projects`. The shortcut to that folder in the shell
is `c`.

You can change that by adding your custom overrides in `~/.localrc`.

### Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Erlang" — you can simply add a `erlang` directory and
put files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `scripts/bootstrap`.

### Naming conventions

There are a few special files in the hierarchy:

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `scripts/bootstrap`.
- **topic/install.sh**: Any file with this name and with exec permission, will
ran at `bootstrap` and `dot_update` phase, and are expected to install plugins,
and stuff like that.

### ZSH plugins

TODO: Update docs as we are not using Antidote anymore
This project uses the [pure][pure] prompt (which is awesome!) and some other
[zsh plugins](/antidote/bundles.txt). All of them managed by [Antidote][antidote],
a faster and simpler Antigen-like program written in Go.

[pure]: https://github.com/sindresorhus/pure
[antidote]: https://github.com/mattmc3/antidote

### Compatibility

I try to keep it working in both Linux (no specific distro) and OS X.

The CI also is also ran on Linux and OSX.
