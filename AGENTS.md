# ASD-STE100 agent guidelines

## Workspace layout (read first)

This repository is in the `~/Apps` workspace. `~/Apps` is a workspace directory. It is not a git repository.

The core repositories must be present before other work:

| Path | Remote |
|---|---|
| `~/Apps/000-0-dotfiles` | `https://github.com/kairin/000-0-dotfiles.git` |
| `~/Apps/000-0-ASD-STE100` | `https://github.com/kairin/000-0-ASD-STE100.git` |
| `~/Apps/000-0-ai` | `https://github.com/kairin/000-0-ai.git` |
| `~/Apps/000-0-workspace` | `https://github.com/kairin/000-0-workspace.git` |

If a path does not exist, clone it with `gh repo clone kairin/<name>`.

There is no layout script. The old `ensure-workspace-layout.sh` was removed. The manual steps are in `000-0-workspace/docs/workspace-layout.md`.

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
