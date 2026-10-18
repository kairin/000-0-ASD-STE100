# STE payload and delivery map

This repository is the source for one reusable STE payload.
Five canonical files form the payload in the root directory.
Three files form a derived package in `skills/ste-writing/`.
Two files stay manual because they are not skill files.
Copy the derived package by hand to the supported tool skill directories.
This work is tracked in
[000-0-ASD-STE100 issue #10](https://github.com/kairin/000-0-ASD-STE100/issues/10).

## Payload files

The five root files form one payload. The first three files map to the derived
package in `skills/ste-writing/`. The last two files stay manual. Copy the files by hand.

| Role | Source file | Package file | Delivery |
|---|---|---|---|
| Skill | `ste-writing-skill.md` | `SKILL.md` | Packaged |
| Checker | `ste-lint.py` | `ste-lint.py` | Packaged |
| Reference | `ste-recurring-errors.md` | `ste-recurring-errors.md` | Packaged |
| Standing rule | `ste-system-append.md` | None | Manual |
| Optional prompt | `ste-senior-engineer-prompt.md` | None | Manual |

`ste-lint.py` is a denylist check, not full Issue 9 conformance.
The checker does not load the approved dictionary.

`ste-system-append.md` has no packaged destination. Add its text to a global
instruction file when a tool requires the standing rule.

`ste-senior-engineer-prompt.md` has no packaged destination. Pass it as a
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

`skills/ste-writing/` in `000-0-ASD-STE100` is the canonical derived package.
Copy this folder directly to the destination of each installed tool:

```bash
mkdir -p ~/.agents/skills
cp -r skills/ste-writing ~/.agents/skills/
```

Copy to a vendor destination only for an installed tool that uses one:
- Hermes: `~/.hermes/skills/ste-writing/`
- Google Antigravity (`agy`): `~/.gemini/config/skills/ste-writing/`

Do not claim a runtime result for a tool that is not installed.

## Comparison checks

Run the full local payload check from this repository:

```bash
scripts/check-ste-payload.sh
```

The check needs `rg` (ripgrep). On RHEL 10 (home), it is in EPEL 10. On
Fedora Asahi Remix (work), it is in the Fedora repositories.
The check compares the three source files with the local package files in `skills/ste-writing/`.
It then compares those files with each required installed destination.
The check also makes sure that the two manual files have no package copy.

Set `STE_DELIVERY_HOME` when the destination home is not the current home. `STE_DELIVERY_HOME` overrides `$HOME` for destination checks.
`AI_REPO` is optional transitional compatibility only until `000-0-ai` task `AI-06` removes the duplicate package. When `AI_REPO` is set, the check also verifies that transitional copy.

The check requires the portable destination when a preferred tool is installed.
It requires a vendor destination only for an installed tool that uses one.

The public CI workflow uses a self-contained mode:

```bash
STE_PAYLOAD_CI=1 bash scripts/check-ste-payload.sh
```

CI checks all five source files, the local package `skills/ste-writing/`, the delivery mappings, the manual and packaged rules, the supported-tool claims, and the active purge checks. CI does not check installed destinations.
The full local mode keeps those destination checks.
