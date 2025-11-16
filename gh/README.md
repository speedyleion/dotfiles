gh the github command line supports extensions. I haven't found a nice way to
list the extensions out to be able to dump them into
`gh/.config/gh/extensions.txt`

To stow gh and the exensions one should do:
```bash
$ stow -t ~ gh
$ cat gh/.config/gh/extensions.txt | xargs -n 1 gh extensions --install
```
