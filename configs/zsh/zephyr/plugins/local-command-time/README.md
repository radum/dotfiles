# zsh-command-time

> Taken from here https://github.com/popstas/zsh-command-time

Plugin that output time: xx after long commands and export ZSH_COMMAND_TIME variable for usage in your scripts.

It similar builin feature REPORTTIME, but it outputs only if user + system time >= REPORTTIME in config. For example:

```bash
$ time sleep 3
sleep 3  0,00s user 0,00s system 0% cpu 3,008 total
```

## Configuration

```bash
# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=3
# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"
# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim vscode)
```

## Customization

You can customize view of the plugin by redefinition of function zsh_command_time. There is an example of custom definition zsh_command_time:

```bash
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
```

Variable $ZSH_COMMAND_TIME contains execution time in seconds. We calculate how many minutes and hours it was and print this information to terminal.

- Commands that were executed less than one minutes highlights by green color.
- Commands that were executed less than three minutes highlights by yellow color.
- Commands that were executed more than three minutes highlights by red color.
