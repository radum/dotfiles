# Homebrew

## Modules

### openssh

On a Mac there is an option to store the ssh passphrase in the keychain, but this is not compatible with with openssh.

Once this module is installed ssh will fail with an error saying `UseKeychain` is not valid. Add `IgnoreUnknown` to make it compatible.

https://developer.apple.com/library/archive/technotes/tn2449/_index.html
https://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots

```
Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```
