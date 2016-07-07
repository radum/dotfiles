# My Atom Configuration

##Font

I use [Hack](https://github.com/chrissimpkins/Hack)

Alternative:
 - Source Code Pro Light from Adobe Source Code Pro.
 - FiraCode - https://github.com/tonsky/FiraCode
 - Operator SSM - http://www.typography.com/blog/introducing-operator

Default is "Menlo Regular" for Mac.

## Theme

Atom Material UI (https://atom.io/themes/atom-material-ui)

Alternatives:

- One Dark (Atom Default)

## Color Theme (syntax highlighting color)

Oceanic Next (https://atom.io/themes/oceanic-next)
It is a clone of https://github.com/voronianski/oceanic-next-color-scheme

Alternatives:

- Solarized (Default with Atom)
- Yoceanic Next Syntax Theme (https://atom.io/themes/yoceanic-next-syntax)

## Installed Packages

The installation can be automated by groupping the `apm install`'s

Use powershell / shell and concatenate the commands like this:

```bash
apm install {plugin}; apm install {plugin}; ...
```

They will be installed sequentially, as does the & operator in cmd.exe for Windows, on a Mac its native.

But keep in mind that ";" runs the second command even if the first fails. So make sure all are installed.

```bash
apm install atom-material-ui atom-material-syntax atom-material-syntax-light;
apm install oceanic-next;

apm install atom-autocomplete-modules
apm install asciidoc-preview
apm install atom-beautify
apm install atom-handlebars
apm install atom-pair
apm install atom-ternjs
apm install autocomplete-paths
apm install color-picker
apm install command-logger
apm install docblockr
apm install editorconfig
apm install editor-stats
apm install emmet
apm install file-icons
apm install git-blame
apm install git-log
apm install git-time-machine (depends on split-diff)
apm install highlight-selected
apm install language-asciidoc
apm install language-powershell
apm install linter
apm install linter-bootlint
apm install linter-eslint
apm install linter-scss-lint
apm install linter-stylelint
apm install merge-conflicts
apm install minimap
apm install minimap-bookmarks
apm install minimap-find-and-replace
apm install minimap-git-diff
apm install minimap-highlight-selected
apm install minimap-linter
apm install minimap-selection
apm install minimap-split-diff
apm install minimap-pigments
apm install monokai
apm install pigments
apm install project-manager
apm install react
apm install seti-syntax
apm install seti-ui
apm install sort-lines
apm install Sublime-Style-Column-Selection
apm install split-diff
apm install symbols-tree-view
apm install tabs-to-spaces
apm install travis-ci-status
apm install visual-bell
apm install Zen
```
