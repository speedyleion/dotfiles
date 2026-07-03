# obsidian

Reference configuration for my Obsidian task workflow. Unlike the other packages
in this repo, this is **not** a `stow` package: Obsidian templates live inside a
vault at a machine-specific path, so there is no stable `$HOME`-relative target.
Instead, copy or symlink the template into your vault.

The "Completed today" query is baked to each note's own date via Templater, so
older daily notes stay a permanent snapshot of what was finished on that day.
The date is parsed from the note title, so it assumes the default daily-note
filename format `YYYY-MM-DD`.

## Idea

Write each task exactly once, in whatever note it comes up in. Daily notes never
copy tasks around — they run live [Tasks](https://publish.obsidian.md/tasks/)
queries that surface whatever is still open. One instance per task, single source
of truth, zero copy-paste rollover.

## Required plugins

- **Tasks** (community) — the query blocks and statuses.
- **Templater** (community) — bakes each note's date into the "Completed today"
  query at creation.
- **Daily Notes** (core) or **Periodic Notes** (community) — creates the note.

## Install the template

Pick your vault's template folder (e.g. `MyVault/Templates/`) and link it:

```bash
ln -s "$(pwd)/templates/daily-note.md" "/path/to/MyVault/Templates/daily-note.md"
```

Then point the daily note at it:

- **Settings → Daily notes → Template file location** → `Templates/daily-note.md`
  (or the Periodic Notes equivalent).
- **Settings → Templater → Template folder location** → your `Templates/` folder,
  and enable **Trigger Templater on new file creation** so the `<% %>` date
  expressions run.

## Statuses

- `[ ]` todo, `[x]` done, `[-]` cancelled (won't do).
- **Settings → Tasks → Dates** → enable *Set done date* and *Set cancelled date*
  so `✅`/`❌` stamps are added automatically. This is what powers the
  "Completed today" query in the template.

Cancel a task with `[-]` and an inline reason instead of marking it done:

```markdown
- [-] Migrate old blog posts ❌ 2026-07-03 — not doing, moving to new CMS
```

## How the queries work

- `not done` excludes both done and cancelled tasks, so checking a task off (or
  cancelling it) makes it drop out of Rollover immediately — nothing to move by
  hand. It then shows up under "Completed today".
- `happens before tomorrow` matches by due/scheduled/start date; undated tasks are
  caught by the `OR (no happens date)` clause so they don't disappear.
- Checking a task off in a query view updates the original task in its source note.
- **Completed today** is a *snapshot*: Templater bakes the note's own date into
  `done on <date>` / `cancelled on <date>` at creation, so an old daily note
  always shows exactly what was finished on that day.
- **Rollover** is *live*, not a snapshot: it always shows currently-open tasks. If
  you open an old note, Rollover reflects what is open now, not what was open back
  then. That is intentional — you never want stale open-task lists to accumulate.
