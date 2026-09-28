# Gitignore review: 000-0-ASD-STE100

**Status:** open. It waits for a reviewer. **Date:** 2026-09-28.

This review asks one question: are there files in Git that should be ignored? The repository is `kairin/000-0-ASD-STE100`, and it is public.

The same concerns, with the same IDs, are on the SOP map. Its link is in the README of `000-0-workspace`. Open it, and then select the **review** tab.

## Result

The review found no secret. Git has no key, token, real password, database file, cache file or log.

This repository has 1 concern(s).

## Concerns

| ID | Severity | Item | Why | Proposed fix |
|---|---|---|---|---|
| STE-1 | Medium | The README key block lists the names of five private repositories and the link to the private SOP map. | The repository is public. Everyone can see the names, for example `000-0-password`. The contents stay private, and the map link opens only for the owner. | Keep it, or remove the folder table from the key block of this README only. |

## Severity

| Severity | Meaning |
|---|---|
| High | A secret, a key or personal data is in Git. |
| Medium | Information is on a public page, and the owner may not want it public. |
| Low | A file belongs to one computer only, or is build output, or a rule is missing. |
| Decision | Nothing is wrong, but the owner must choose. |

## What the review checked

- File names: patterns that `.gitignore` usually excludes, for example `.env`, `*.token`, `*.sqlite`, `*.duckdb`, `__pycache__`, `.venv`, `node_modules`, backups, logs and `settings.local.json`.
- File contents: key formats (`sk-`, `ghp_`, `github_pat_`, `hf_`, `AIza`, `tskey-`, private key blocks) and database URLs with a password.
- File contents: email addresses, private IP addresses, host names of this computer, and files larger than 500 KB.
- The review did not print any value. It sorted each match by its pattern only.

## General notes

- If a file stops being tracked now, it stays in older commits. None of the files above is secret, so `.gitignore` and `git rm --cached` are enough. There is no need to rewrite history.

## For the reviewer

- [ ] STE-1: agree with the severity, and choose: fix as proposed, fix another way, or keep.
- [ ] Confirm that no other file in this repository must be ignored.
- [ ] Write your name and the date below. Then close the review.

Reviewer:

Date:
