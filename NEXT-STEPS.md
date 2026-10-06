# Next steps for 000-0-ASD-STE100

**Status:** to do. Nothing on this page is done yet.
**Source:** the architecture review of 2026-10-07. The full plan is in
`000-0-workspace/docs/alignment-plan-2026-10-07.md`. The index of all
repositories is `000-0-workspace/docs/next-steps.md`.
**Task:** T04. **Work branch:** make a new branch from `main`, for example
`docs/rhel10-followup`, and open a new pull request. The branch names and
pull-request numbers inside the task text below were merged on 2026-10-07.
Do not reuse them.
**Depends on:** nothing. **Needs the owner (user-gated):** no.

When all the steps are done and verified, delete this file in the same pull request.

## The current plan (binding)

- RHEL 10.2 is the primary operating system: GNOME, Ptyxis, `dnf`, Podman, SELinux, bash.
- **bash is the only shell.** fish is retired (review decision N1). bash gets fish-like tools: `ble.sh`, `bash-completion`, `atuin`, `fzf`, `zoxide`, `starship` (amendment A1, below).
- EPEL 10 is required. It gives `pass`, `fzf`, `uv`, `ripgrep`, `podman-compose` and ShellCheck.
- `000-0-dotfiles` and `000-0-workspace` are documentation only. The other core repositories hold documents and product files only. They have no installer, no engine and no tests of removed code.
- Keys are in the `pass` store. A command gets a key only through `with-secret` (`000-0-password`). `~/.dotfiles/` and `~/Apps/.envrc` do not exist.
- One askpass helper: `~/.local/bin/askpass.sh` (zenity). `ksshaskpass` is not used.
- Do not keep a file only because it records the past. Git history keeps it.

## Review findings for this repository

**000-0-ASD-STE100 #21** (1 commit, MERGEABLE, CI passes)
- `README.md:104-123` still "The supported delivery path is the downstream setup command… `setup apply`"; `:141-143` "downstream delivery system copies". `AGENTS.md:32-33` same. `.specify/memory/constitution.md:20,23,30` (`000-dotfiles ./setup apply`). Fix: T04.
- `AGENTS.md:9-14` lists 4 of the 6 core repos. Fix: T04.
- `docs/ste-delivery.md:3-4,18-20` "Automatic" delivery column (the script greps the literal strings "Automatic"/"Manual" at `check-ste-payload.sh:29-36`). `:48-53` copy command omits `~/.hermes/skills` and `~/.gemini/config/skills`, which the full check requires when `hermes`/`agy` are on PATH (both are). `:38-39` table separator has 4 columns for 3 headers. `:64` "rg is in EPEL 10" (true; EPEL not enabled). Fix: T04.
- `scripts/check-ste-payload.sh:159` CI message claims "package, destination … passed" although skipped. Fix: T04.
- `README.md:44-50` claims three places in the AI tool configuration point here; none exist on this machine. Fix: T04 (rewrite as the target state, with the check command).
- STE-1 open (public repo lists private names). Fix: T04 (I).

## Task

**T04 — 000-0-ASD-STE100** (`docs/rhel10-alignment`, PR #21). **Never write the words that the purge check forbids. Do not add a vendor-named pointer file.**
Files: `README.md`, `AGENTS.md`, `.specify/memory/constitution.md`, `docs/ste-delivery.md`, `scripts/check-ste-payload.sh`, `GITIGNORE-REVIEW.md`, `CHANGELOG.md`.
Steps:
1. `README.md:104-123` and `:141-143`: replace with "## Install the writing skill" = the three copy commands (`mkdir -p ~/.agents/skills ~/.hermes/skills ~/.gemini/config/skills` then `cp -r ~/Apps/000-0-ai/skills/ste-writing` to each), then "Check: `AI_REPO=~/Apps/000-0-ai scripts/check-ste-payload.sh`". `:44-50`: rewrite as "Target state on a computer" (the three places) with the check command, not as a claim. `:118,134-135` keep `uv run` (uv comes from EPEL) but add "(or `python3 ste-lint.py`)". Key information block: delete the folder table and the sentence with the map link; keep the five bullets and "This folder is part of the `~/Apps` SOP."
2. `AGENTS.md:9-14`: list all six core repos (`000-0-dotfiles`, `000-0-ASD-STE100`, `000-0-password`, `000-0-ai`, `000-0-workspace`, `000-0-tables`); `:32-33` → "You copy the skill package to the agent skill folders by hand (see docs/ste-delivery.md)."; `:20` keep (GEMINI.md is a symlink here, true).
3. `.specify/memory/constitution.md:20` → "The package copy in `000-0-ai/skills/ste-writing/` and the agent skill folders are made by hand from these files."; `:23` → "Where a harness has a global-instruction surface, the five-line rule MUST be copied there by hand."; `:30` → "Supported install for this owner's computers is the manual copy in docs/ste-delivery.md. A `ln -s` into one agent's skills directory is not the supported path."
4. `docs/ste-delivery.md`: `:3-4` → "The package in `000-0-ai` holds three files that you copy by hand."; rename the delivery label "Automatic" to "Package" in the table **and** in `scripts/check-ste-payload.sh:29-36` (same literal); fix the separator at `:38-39` to three columns; `:48-53` add the hermes and gemini copy lines; `:64` → "On RHEL 10, `ripgrep` comes from EPEL 10 (`sudo dnf install ripgrep`)."
5. `scripts/check-ste-payload.sh:159`: CI message → "STE source, mapping and purge checks passed (package and destination checks run only outside CI)".
6. `GITIGNORE-REVIEW.md`: "Update 2026-10-07: STE-1 fixed. The key block no longer lists the private folders or the map link. Status: closed."
7. `CHANGELOG.md` entry.
Verification: `STE_PAYLOAD_CI=1 scripts/check-ste-payload.sh` exits 0 (needs `rg`; if not on PATH, run with a shim `rg(){ grep -rn -i "$@"; }` is NOT equivalent — instead run `PATH=/tmp/rgshim:$PATH` only if a real rg binary exists; otherwise report "needs ripgrep (T27)" in the PR); the purge grep in `scripts/check-ste-payload.sh` → nothing; `grep -n 'setup apply\|downstream' README.md AGENTS.md` → nothing.
Acceptance: CI `ste-payload-validation` green on the PR.

## Shared text used by this task



## Amendment A1 (owner decision, 2026-10-07): bash with fish-like tools

The owner confirmed decision N1: **bash is the shell.** The owner also said:
"must install the relevant tools that makes bash functionally the same as
fish". This amendment replaces the "Rejected: … ble.sh …" sentence of N1.
Where this amendment and a task disagree, this amendment wins.

| fish feature | bash tool | Source on RHEL 10 |
|---|---|---|
| Suggestions from history while you type | `ble.sh` | Upstream release, user space (`~/.local/share/blesh`) |
| Syntax colours on the command line | `ble.sh` | Same |
| Tab completion with a menu | `bash-completion` + `ble.sh` | `bash-completion` is installed (BaseOS) |
| Abbreviations (`abbr`) | `ble-sabbrev` in `ble.sh` | Same |
| History search (`Ctrl+R`) | `atuin` | EPEL 10 (18.12) |
| File and folder pickers (`Ctrl+T`, `Alt+C`) | `fzf` | EPEL 10 |
| `z` to jump to folders | `zoxide` | Upstream, `~/.local/bin` |
| Prompt | `starship` | Upstream, `~/.local/bin` |
| Per-folder environment | `direnv` | Upstream, `~/.local/bin` |

**Install `ble.sh` (no root):**

```bash
tmp=$(mktemp -d)
curl -fsSL https://github.com/akinomyoga/ble.sh/releases/download/v0.4.0-devel3/ble-0.4.0-devel3.tar.xz | tar -xJf - -C "$tmp"
bash "$tmp/ble-0.4.0-devel3/ble.sh" --install ~/.local/share
rm -rf "$tmp"
```

Expect: `~/.local/share/blesh/ble.sh` exists. Check for a newer release first:
`gh release view --repo akinomyoga/ble.sh --json tagName --jq .tagName`.

**Install `atuin` and `fzf`** (after EPEL, owner runs): `sudo dnf install atuin fzf`.

**`~/.bashrc.d/` snippets: changes to S6.** RHEL's `~/.bashrc` sources
`~/.bashrc.d/*` in name order. `ble.sh` must load first and attach last:

- `01-blesh.sh`: `[[ $- == *i* && -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh --noattach`
- `40-fzf.sh` (changed): `if [[ $- == *i* ]] && command -v fzf >/dev/null 2>&1; then eval "$(fzf --bash)"; fi` — keep it; `atuin` takes `Ctrl+R` because it loads later.
- `50-atuin.sh`: `if [[ $- == *i* ]] && command -v atuin >/dev/null 2>&1; then eval "$(atuin init bash)"; fi`
- `60-abbr.sh`: `if [[ ${BLE_VERSION-} ]]; then ble-sabbrev g='git' gs='git status' gd='git diff' gc='git commit' gp='git push'; fi`
- `99-blesh-attach.sh`: `[[ ! ${BLE_VERSION-} ]] || ble-attach`

The other S6 files (`00-local-bin-path.sh`, `10-sudo-askpass.sh`,
`20-direnv.sh`, `30-starship.sh`, `45-zoxide.sh`) stay as they are. Total: ten
files.

**Expect** (new Ptyxis tab): grey suggestions appear while you type; the
command is coloured; `Ctrl+R` opens atuin; `z <name>` jumps; `g` + space
expands to `git`.

**Tasks that change because of A1:**
- **T01** (000-0-dotfiles): `configuration-reference.md` bash section has the
  ten snippets and the `ble.sh` install; `rhel-10-setup.md` tool table adds
  rows `ble.sh` (upstream) and `atuin` (EPEL), and `bash-completion`
  (installed); the README expect row says "ten files"; `decisions.md` records
  A1 with the fish-to-bash table above.
- **T02** (000-0-workspace): the site dotfiles page names the fish-like tools.
- **T26** (machine, user space): also install `ble.sh` and write the ten
  snippets.
- **T27** (owner, root): the `dnf install` line adds `atuin`.
