# ASD-STE100 agent guidelines

## Workspace layout (read first)

This repository is one folder of the owner's `~/Apps` workspace. `~/Apps` is a workspace directory. It is not a git repository. The owner's private notes describe the other folders.

`GEMINI.md` in this repository is a compatibility symlink to this file.

## Writing rule

1. LANGUAGE: Write all prose in ASD-STE100 Simplified Technical English.
2. Use the `ste-writing` skill for the rules.
3. Check each draft with `uv run ste-lint.py <file>` next to the skill file.
4. SCOPE: This rule applies to prose. It does not apply to code, identifiers, or command syntax.
5. SCOPE: This rule also applies to comments made in code.

The checker is an anti-slop denylist. A lint pass is not Issue 9 conformance.

Source files live in this repository. A downstream delivery repository copies
the skill to Hermes, Pi, OpenAI Codex CLI, and Google Antigravity (`agy`).

## Git identity

Commit as `Mister K <678459+kairin@users.noreply.github.com>`. This is the
public GitHub name and the GitHub noreply email. Do not commit with another
name or with a personal email address. Check with `git config user.name` and
`git config user.email` before you commit.
