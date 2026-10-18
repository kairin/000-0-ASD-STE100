# ASD-STE100 agent guidelines

## Workspace layout (read first)

This repository is one folder of the owner's `~/Apps` workspace. `~/Apps` is a workspace directory. It is not a git repository. The owner's private notes describe the other folders.

The other agent instruction files in this folder are regular pointer files to this file. They are not symlinks. Do not edit them. Update instructions here only. See `~/Apps/000-0-workspace/docs/agent-instruction-files.md`.

## Shared workspace policy

Read `~/Apps/000-0-workspace/docs/repository-protection.md` for delivery,
branches, external isolated worktrees, visibility, Git identity, and secrets. Read
`~/Apps/000-0-workspace/docs/agent-instruction-files.md` for pointer rules,
policy routing, owner decisions, unchecked claims, and shared conduct. Read
`~/Apps/000-0-workspace/docs/project-quality-checks.md` for the local baseline
and verification. Read `~/Apps/000-0-workspace/docs/update-and-development-tools.md`
before maintenance work, including retired-boundary rules. These references are
instructions to read. If required policy is missing, the affected task is
incomplete; do not clone, install, or reconstruct it.

## Writing rule

1. LANGUAGE: Write all prose in ASD-STE100 Simplified Technical English.
2. Use the `ste-writing` skill for the rules.
3. Check each draft with `uv run ste-lint.py <file>` next to the skill file.
4. SCOPE: This rule applies to prose. It does not apply to code, identifiers, or command syntax.
5. SCOPE: This rule also applies to comments made in code.

The checker is an anti-slop denylist. A lint pass is not Issue 9 conformance.

Source files live in this repository. A downstream delivery repository copies
the skill to Hermes, Pi, OpenAI Codex CLI, and Google Antigravity (`agy`).

## Workflow review follow-up

Use the terms `observed`, `tested`, `source-reviewed`, and `proposed` exactly.
Do not use a successful command as proof for a check that did not run. Keep
each core repository note short and keep the full evidence in the workspace
review.
