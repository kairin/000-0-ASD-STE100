# Next steps

## agy round 2 checklist (2026-10-18)

This checklist is the working copy of the round 2 tasks for `000-0-ASD-STE100`. The [round 2 review](../000-0-workspace/docs/core-agy-review-round2-2026-10-18.md#000-0-asd-ste100) gives the evidence, and the [decision record](../000-0-workspace/docs/core-agy-decisions-2026-10-18.md) gives the reasons for the decided items. Where an earlier status in this file disagrees with this section, use this section.

### Status

"Ruled now" is the verified status. "Target" is the status after every task below passes on this host, before any delivery.

| Task | Ruled now | Target |
|---|---|---|
| AS-01 | accepted | accepted (unchanged) |
| AS-02 | accepted | accepted (unchanged) |
| AS-03 | tested | accepted |
| AS-04 | accepted | accepted (unchanged) |

### Why round 1 failed here

Every task in this repository was ruled CORRECT or BLOCKED-CORRECT. Only the evidence corrections below remain.

### Do not delete or overwrite

- In every repository: Git branches, tags, stashes, reflog, untracked and ignored files. Do not run `git reset --hard`, `git clean`, a force push or a branch delete. Do not delete a dated receipt or a historical document.
- In `000-0-ASD-STE100`: Repository files during a check, `$HOME` skill destinations without a recorded parity comparison, and the AI copy `000-0-ai/skills/ste-writing/` until AI-06 is accepted.
- Allowed deletion in `000-0-ASD-STE100`: None during a check. Remove the new `rm -rf "$local_package_dir/__pycache__"` from `scripts/check-ste-payload.sh:42`, and exclude `__pycache__` from the comparison instead (item AS-02.R1).

Apply the six delete rules of the [preservation contract](../000-0-workspace/docs/core-agy-review-round2-2026-10-18.md#preservation-contract-what-you-must-not-delete-or-overwrite) to every delete, move or replace operation.

### Tasks

Do the tasks from top to bottom. Each line gives: ID | parent or source | priority | files | what to do | acceptance check with its negative case | depends on. Tick a box only after its acceptance check passes and you have recorded the real command and exit code.

- [ ] **AS-03.R1** | AS-03 | P1 | scripts/check-ste-payload.sh:109-160, :198 | In full mode, when no destination was compared (no tool found or all skipped), print "incomplete: no destination compared (hermes/pi/codex/agy not on PATH)" to stderr and exit 2 (not 0); never print "destination ... checks passed" unless at least one destination was compared. Add a visible message on `cmp -s` failures (lines 49, 86-87) instead of the bare `set -e` exit. | Negative: `PATH=/usr/bin:/bin bash scripts/check-ste-payload.sh` -> exit 2 with the incomplete notice; CI mode unchanged (exit 0); synthetic `STE_DELIVERY_HOME` positive -> exit 0 with three match lines per destination. | none
- [ ] **AS-03.R2'** | decision record | `~/.agents/skills/ste-writing/`, `~/.hermes/skills/ste-writing/`, `~/.gemini/config/skills/ste-writing/`, ledger AS-03 | Create-only copy of the three ASD-derived files (stop and report if a destination exists and differs; never overwrite), then run `bash scripts/check-ste-payload.sh` (full mode) -> exit 0 with three `source-destination match` lines per destination; record; add "office-linux: incomplete" to `incomplete`. | Negative retained: `PATH=/usr/bin:/bin` run -> exit 2 incomplete notice. | AS-03.R1.
- [ ] **AS-02.R1** | AS-02 | P2 | check-ste-payload.sh:42, :73, :106 | Remove `rm -rf "$local_package_dir/__pycache__"` (:42), because a check must not change the repository; exclude `__pycache__` from the comparison instead. Use `find ... \( -type f -o -type l \)` so symlinked extra files are reported; make the `__pycache__` exclusion glob-safe (`-path "$dir/__pycache__" -prune`). | Fixtures: a `__pycache__/x.pyc` file in the package still exists after the checker runs, and the checker exits 0; `extra.md -> SKILL.md` symlink -> exit 1; dir named `ai[1]` with real `__pycache__` -> exit 0. | none
- [ ] **AS-01.R1** | AS-01 | P2 | ledger AS-01 | "0 em dashes" -> README em_dash=1 (README.md:231 heading, pre-existing); re-pin identities (HEAD 65ffef3a, branch 20261018-090140-ste-owner-delivery; dirty AGENTS.md, NEXT-STEPS.md, README.md, docs/as-implementation-review-2026-10-18.md, scripts/check-ste-payload.sh). Note PR #35 CI ran the HEAD checker, not the working-tree one. | Entry reproducible. | none
- [ ] **AS-02.R2** | AS-02 | P2 | ledger AS-02 | Record the pinned AI copy identity: 000-0-ai skills/ste-writing clean at HEAD dd1a19bb (last change b5be53c5), file hashes 0c924e47/02203cd5/d721d9f4. | Entry present. | none
- [ ] **AS-04.R1** | AS-04 | P3 | docs/ste-delivery.md table | Fix the 4-vs-3 column separator cosmetic issue. | Renders. | none

### Physical constraints (not agy work on this host)

- AS-03 destination copies on the office host.

**Status:** to do.

This repository has follow-up work from the review of 2026-10-07 (task T04).
The owner keeps the full instructions in private notes, because they contain
local paths. Ask the owner for them before you start.

When the work is done, delete this file.
