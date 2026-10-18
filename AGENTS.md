# ASD-STE100 agent guidelines

## Workspace layout (read first)

This repository is one folder of the owner's `~/Apps` workspace. `~/Apps` is a workspace directory. It is not a git repository. The owner's private notes describe the other folders.

The other agent instruction files in this folder are regular pointer files to this file. They are not symlinks. Do not edit them. Update instructions here only. See `~/Apps/000-0-workspace/docs/agent-instruction-files.md`.

## Core system contract and public boundary

The full owner system requires the complete manifest-declared core repository set.
See `../000-0-manifest/docs/core-system-contract.md` and `../000-0-manifest/core-layout.json`
once published in `M-01` and `M-03`. This repository checkout alone is partial.

`000-0-manifest` stays public. It contains no personal data and no secrets.
Report missing members, instructions, or an unestablished shipment baseline as incomplete.
Do not clone, install, or reset to fix missing members.
Local `ste-lint.py` and `scripts/check-ste-payload.sh` checks stay independent.

## Secrets

The secret rules of the workspace apply only to real secret values: a real key, token, password or credential. Documentation that tells how to make, store or use a credential is not a secret. A placeholder such as `<REDACTED>` or `PASTE-TOKEN-HERE` is not a secret. Report a secret problem only when you find a real value. Do not report placeholders or setup steps as secret problems.

## Writing rule

1. LANGUAGE: Write all prose in ASD-STE100 Simplified Technical English.
2. Use the `ste-writing` skill for the rules.
3. Check each draft with `uv run ste-lint.py <file>` next to the skill file.
4. SCOPE: This rule applies to prose. It does not apply to code, identifiers, or command syntax.
5. SCOPE: This rule also applies to comments made in code.

The checker is an anti-slop denylist. A lint pass is not Issue 9 conformance.

Source files live in this repository. The derived package in `skills/ste-writing/`
copies to Hermes, Pi, OpenAI Codex CLI, and Google Antigravity (`agy`).

## Owner decisions and unchecked claims

- The owner's stated decision beats a general rule. Before you flag
  something, check whether the owner already decided on it (repository
  docs, AGENTS.md, earlier instructions). If they did, do not flag it again.
- Check a claim yourself before acting on it, above all a claim from an
  earlier session, a subagent or a report. Look at the file, image or data.
- Do only what was asked. Do not add new "outstanding issues" to a task, and
  do not raise again one the owner dismissed.
- Never propose deleting, purging or unpublishing anything because of a claim
  you have not checked yourself.

## Git identity

Commit as `Mister K <678459+kairin@users.noreply.github.com>`. This is the
public GitHub name and the GitHub noreply email. Do not commit with another
name or with a personal email address. Check with `git config user.name` and
`git config user.email` before you commit.

## Routine core sync

The owner requires `update` to sync all nine core repositories first.
It must save and restore unfinished local work and the original branch. Routine sync does not commit or push that work. A failed
sync or restoration blocks updater replacement and application updates.
See `../000-0-workspace/docs/repository-protection.md` for this exception to
the delivery workflow. The implementation belongs to `000-0-ai`.

## Development tool ownership and startup

Use `../000-0-workspace/docs/update-and-development-tools.md` for the procedure.
`000-0-ai` owns `update`. `000-0-dotfiles` owns the non-AI doctor, installer and
catalog. This new system does not restore the retired dotfiles engine.

Run `update` as the owner. It syncs core repos, checks its published release,
then calls the doctor and repairs missing or broken required tools.
Do not repeat those calls manually during routine updates.
Do not reinstall healthy tools or reinstall for PATH or authentication problems.
Incomplete checks or repairs block app updates. The local quality checker never installs tools.
Only DNF repairs use `sudo -n`. Use `sudo -v` first when needed.
If authorization expires, report the failure. Never run `sudo update`.

## Workflow review follow-up

Use the terms `observed`, `tested`, `source-reviewed`, and `proposed` exactly.
Do not use a successful command as proof for a check that did not run. Keep
each core repository note short and keep the full evidence in the workspace
review.
