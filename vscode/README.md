VS Code seems to spread its installation and config around a bit.

The settings.json and keybindings.json for mac is at 
`~/Library/Application\ Support/Code/User/`

The extensions are at  `~/.vscode/extensions`, but that's the full download so
that directory is not saved into the dotfiles.

To stow VS Code, one should do:
```bash
$ stow -t ~/Library/Application\ Support/Code/User vscode
$ cat vscode/extensions.txt | xargs -n 1 code --install-extension
```

Similar can be done with any VS Code derivative, just be sure and know the
path. I.e. Windsurf is 
```bash
$ stow -t  ~/Library/Application\ Support/Windsurf/User vscode
$ cat vscode/extensions.txt | xargs -n 1 surf --install-extension
```

To save or update the stored extensions one needs to manually do
```bash
$ code --list-extensions > vscode/extensions.txt
```

