# STE payload and delivery map

This repository is the source for one reusable STE payload.
The downstream repository packages three files for automatic delivery.
Two files remain manual because they are not skill files.
This work is tracked in
[000-0-ASD-STE100 issue #10](https://github.com/kairin/000-0-ASD-STE100/issues/10).

## Payload files

The five files form one payload. The first three go into the package in
`000-0-ai/skills/ste-writing/`. The last two files remain manual.
The synchronizer script and the dotfiles manifest no longer exist
(2026-10-07). Copy the files by hand.

| Role | Source file | Package file | Delivery |
|---|---|---|---|
| Skill | `ste-writing-skill.md` | `SKILL.md` | Automatic |
| Checker | `ste-lint.py` | `ste-lint.py` | Automatic |
| Reference | `ste-recurring-errors.md` | `ste-recurring-errors.md` | Automatic |
| Standing rule | `ste-system-append.md` | None | Manual |
| Optional prompt | `ste-senior-engineer-prompt.md` | None | Manual |

`ste-lint.py` is a denylist check, not full Issue 9 conformance.
The checker does not load the approved dictionary.

`ste-system-append.md` has no automatic destination. Add its text to a global
instruction file when a tool requires the standing rule.

`ste-senior-engineer-prompt.md` has no automatic destination. Pass it as a
full system prompt when a tool requires the complete prompt.

## Skill destinations

The portable skill directory is common to the four preferred tools.
The package files use the same directory as `SKILL.md`.

| Tool | Portable skill directory | Vendor skill directory |
|---|---|---|---|
| Hermes | `~/.agents/skills/ste-writing/` | `~/.hermes/skills/ste-writing/` |
| Pi | `~/.agents/skills/ste-writing/` | None |
| OpenAI Codex CLI | `~/.agents/skills/ste-writing/` | None |
| Google Antigravity (`agy`) | `~/.agents/skills/ste-writing/` | `~/.gemini/config/skills/ste-writing/` |

Copy the three automatic files into `000-0-ai/skills/ste-writing/` by hand.
Then copy that folder to the destination of each installed tool:

```bash
mkdir -p ~/.agents/skills
cp -r ~/Apps/000-0-ai/skills/ste-writing ~/.agents/skills/
```

Copy to a vendor destination only for an installed tool that uses one.
Do not claim a runtime result for a tool that is not installed.

## Comparison checks

Run the full local payload check from this repository:

```bash
AI_REPO=../000-0-ai scripts/check-ste-payload.sh
```

The check needs `rg` (ripgrep). On RHEL 10, it is in EPEL 10.
The check compares the three automatic source files with their package files.
It then compares those files with each required installed destination.
The check also makes sure that the two manual files have no package copy.

Set `STE_DELIVERY_HOME` when the destination home is not the current home.
The check requires the portable destination when a preferred tool is installed.
It requires a vendor destination only for an installed tool that uses one.

The public CI workflow uses a self-contained mode:

```bash
STE_PAYLOAD_CI=1 bash scripts/check-ste-payload.sh
```

CI checks all five source files, the delivery mappings, the manual and
automatic rules, the supported-tool claims, and the active purge checks. CI
does not check the package in the sibling `000-0-ai` repository
(`skills/ste-writing/`) or installed destinations.
The full local mode keeps those cross-repository and machine checks.
