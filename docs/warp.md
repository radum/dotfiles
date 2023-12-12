# Warp Terminal

## Incompatible tools

- https://docs.warp.dev/help/known-issues#list-of-incompatible-tools

## Tips

### Disable tools only for Warp

```shell
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

# fzf code

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi
```
