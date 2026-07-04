# obsidian

Reference configuration for my Obsidian task workflow. Unlike the other packages
in this repo, this is **not** a `stow` package: Obsidian templates live inside a
vault at a machine-specific path, so there is no stable `$HOME` relative target.
Instead, copy or symlink the template into the vault.

## Idea

Write each task exactly once, in whatever note it comes up in. Daily notes never
copy tasks around — they run live [Tasks](https://publish.obsidian.md/tasks/)
queries that surface whatever is still open. One instance per task, single source
of truth, zero copy-paste rollover.

## Required plugins

- **Tasks** (community) - the query blocks and statuses.
- **Templates** (core) - provides the `{{date}}` variable for task queries.
- **Daily Notes** (core) - creates the notes

## Install the template

Pick the vault's template folder (e.g. `MyVault/Templates/`) and link it:

```bash
ln -s "$(pwd)/templates/daily-note.md" "/path/to/MyVault/Templates/daily-note.md"
```

Let Obsidian know about the templates folder:

- Settings -> Templates -> Template folder location -> `Templates` 
- Settings -> Files and links -> Excluded files -> add `Templates/`.

Point the daily note at the template:

- Settings -> Daily notes -> Template file location -> `Templates/daily-note.md`

Note the caveat about excluding the template folder: 
It only downranks the file in the Quick Switcher (Cmd+O). It does not hide it
from searches.
