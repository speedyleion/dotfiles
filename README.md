# dotfiles
dotfiles for common tools I use. 

This repository is structured to work with
[stow](https://www.gnu.org/software/stow/). The idea was taken from this 
[blog post](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two).

An important note when stowing is that the target directory by default is the parent directory of the dotfiles repository. To change this use the `-t/--target` option.

To stow in the home directory:
```bash
$ stow -t ~ <subdirectory-in-dotfiles>
```

For example this would stow the git configuration files into the home directory.
```bash
$ stow -t ~ git
```
