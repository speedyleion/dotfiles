<%*
/*
 * Templater daily note template.
 * Requires plugins: Tasks, Templater, and (Daily Notes core or Periodic Notes).
 * The date is parsed from the note's title (default daily-note format
 * YYYY-MM-DD) so each note is a permanent snapshot of its own day, even if
 * created ahead of time or backfilled. See ../README.md for setup.
 */
const day = tp.date.now("YYYY-MM-DD", 0, tp.file.title, "YYYY-MM-DD");
-%>
# <% tp.date.now("YYYY-MM-DD, dddd", 0, tp.file.title, "YYYY-MM-DD") %>

## Rollover
```tasks
not done
(happens before tomorrow) OR (no happens date)
sort by priority
sort by due
```

## Tasks created today
- [ ] 

## Notes


## Completed today
```tasks
(done on <% day %>) OR (cancelled on <% day %>)
sort by done reverse
```
