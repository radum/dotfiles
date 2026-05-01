# Shell history files

The shell history is saved under the following files:

- `~/.local/share/zsh/zsh_history`
  - for ZSH using `HISTFILE` set in Zephyr history plugin.
  - The location is in .local because Zephyr sets XDG Base Directories and I didn't disable them to use my root folder.
- `~/.logs` folder that I create manually and use the zsh preexec to store each day of logs via `configs/zsh/zsh-config.zsh`
- `~/.local/share/atuin/history.db` for Atuin (all files in the folder are important, but the `history.db` is the main one)
