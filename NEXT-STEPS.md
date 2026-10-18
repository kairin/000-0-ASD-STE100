# Next steps

**Status:** in progress (`tested` on branch `20261018-090140-ste-owner-delivery`).

This document records the decomposed task list, goals, and verification status for `000-0-ASD-STE100` (`AS-01` through `AS-04`).

## Completed local implementation (`tested`)

- [x] **`AS-00`: Baseline and branch setup**
  - **Goal:** Switch from `main` (`244917d030680ab42a7f74399c16802ff89edae5`) to feature branch `20261018-090140-ste-owner-delivery` and record SHA-256 hashes of all five canonical root files.
  - **Result:** Branch created. Root file hashes match the pinned `000-0-ai/skills/ste-writing/` copy.

- [x] **`AS-01.1`: Replace retired setup labels in `README.md`**
  - **Goal:** Remove `setup apply` and automated-package claims in `README.md:112-177`. Document manual stages from root sources to `skills/ste-writing/` and installed tool folders.
  - **Result:** Updated `README.md`. Linted at `per100w=1.01`.

- [x] **`AS-01.2`: Replace `Automatic` delivery labels in `docs/ste-delivery.md`**
  - **Goal:** Change `Automatic` to `Packaged` in `docs/ste-delivery.md:11-32` while keeping `ste-system-append.md` and `ste-senior-engineer-prompt.md` as `Manual`.
  - **Result:** Updated `docs/ste-delivery.md`. Linted at `per100w=1.62`.

- [x] **`AS-01.3`: Update delivery label assertions in `scripts/check-ste-payload.sh`**
  - **Goal:** Match `| Packaged` table rows in `scripts/check-ste-payload.sh:26-35` and fix ShellCheck warnings (`SC1007`, `SC2016`, `SC2088`).
  - **Result:** `bash -n` and `shellcheck` exit `0` with `0` warnings.

- [x] **`AS-02.1`: Create derived package files in `skills/ste-writing/`**
  - **Goal:** Copy `ste-writing-skill.md` to `skills/ste-writing/SKILL.md`, `ste-lint.py` to `skills/ste-writing/ste-lint.py`, and `ste-recurring-errors.md` to `skills/ste-writing/ste-recurring-errors.md`.
  - **Result:** Created all three files with exact byte parity.

- [x] **`AS-02.2`: Enforce local package parity in `scripts/check-ste-payload.sh`**
  - **Goal:** Verify byte parity (`cmp -s`) between root sources and `skills/ste-writing/`, block manual files in the package, and reject unexpected files in CI and full modes (`scripts/check-ste-payload.sh:36-74`).
  - **Result:** `STE_PAYLOAD_CI=1 bash scripts/check-ste-payload.sh` exits `0`.

- [x] **`AS-03.1`: Point consumer delivery routes to `000-0-ASD-STE100/skills/ste-writing/`**
  - **Goal:** Update `docs/ste-delivery.md:33-87` and `scripts/check-ste-payload.sh:76-156` so Hermes, Pi, OpenAI Codex CLI, and Google Antigravity (`agy`) copy from `skills/ste-writing/` without requiring `AI_REPO`.
  - **Result:** `AI_REPO` is now an optional transitional check until `AI-06`.

- [x] **`AS-03.2`: Verify synthetic destination parity and drift rejection**
  - **Goal:** Run `scripts/check-ste-payload.sh` against synthetic destinations (`STE_DELIVERY_HOME`) and verify that file drift causes a non-zero exit.
  - **Result:** Synthetic parity exits `0`. Injected drift in `SKILL.md` exits `1`.

- [x] **`AS-04.1`: Add core system contract and public boundary rules**
  - **Goal:** Document `../000-0-manifest/docs/core-system-contract.md`, `../000-0-manifest/core-layout.json`, public boundary rules, and independent local checks in `README.md:61-71` and `AGENTS.md:9-19`.
  - **Result:** Added to both files. `AGENTS.md` linted at `per100w=1.47`.

- [x] **`AS-04.2`: Trim repeated updater startup prose in `README.md`**
  - **Goal:** Replace duplicated `Updater 1.0.002` startup text in `README.md:208-227` with links to workspace and AI docs while keeping the Mermaid diagram and STE acceptance boundaries.
  - **Result:** Updated `README.md:208-227`. All local markdown links resolve.

- [x] **`AS-04.3`: Document task checklist and gates in `NEXT-STEPS.md`**
  - **Goal:** Replace the 2026-10-07 note with the current `AS-01` through `AS-04` checklist and open gates.
  - **Result:** Documented in this file.

- [x] **`AS-05`: Run repository and shared quality baseline checks**
  - **Goal:** Pass `check-projects.py`, `check-agent-pointers.py`, and `secret-scan.py`.
  - **Result:** `check-projects.py` passed (`0` findings), pointer files stayed untouched (`0` fail), and `secret-scan.py` found `0` secret candidates.

## Pending external gates (`proposed` / `incomplete`)

- [ ] **Upstream task `M-01` (`000-0-manifest`):** Merge `docs/core-system-contract.md` and `core-layout.schema.json` to `origin/main` so `AS-01` and `AS-04` can move from `tested` to `accepted`.
- [ ] **Upstream task `M-03` (`000-0-manifest`):** Publish `core-layout.json` on `origin/main` so `AS-02` can move from `tested` to `accepted`.
- [ ] **Upstream task `WS-02` (`000-0-workspace`):** Accept the workspace entrypoint contract on `origin/main` so `AS-04` can move from `tested` to `accepted`.
- [ ] **Authorized live `$HOME` skill deployment (`AS-03`):** Copy `skills/ste-writing/` to `~/.agents/skills/ste-writing/`, `~/.hermes/skills/ste-writing/`, and `~/.gemini/config/skills/ste-writing/` during an authorized deployment, then run `bash scripts/check-ste-payload.sh`.
- [ ] **Downstream task `AI-06` (`000-0-ai`):** Retire the duplicate `000-0-ai/skills/ste-writing/` package after consumer acceptance.
- [ ] **Gate `G-SHIP` and task `M-09` (`000-0-manifest`):** Select a reviewed commit or tag from `000-0-ASD-STE100` for the shipment baseline only at gate `G-SHIP`.
