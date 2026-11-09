## 2026-11-09: Correct stale install references

- Constitution: the install route is the `000-0-ai` `skills/ste-writing/`
  package, copied by the `000-0-ai` installer and `update`. Removed the
  retired `000-dotfiles` `./setup apply` route. The banner records the hand
  correction.

## 2026-11-09: Remove duplicate remediation copy

- Remove `docs/website-artifact-remediation.md`. The shared copy is in `000-0-workspace`.
- Link `docs/website-artifact-intent.md` to the shared copy.
- Record that STE-1 closed on 2026-10-08 in `GITIGNORE-REVIEW.md`. Only the reviewer step is open.

## 2026-10-31: Update guidance links

- Replace the copied update flow with links to the shared procedure and the current handover.
- Mark the 2026-10-15 workflow note as historical.

## 2026-10-23: Separate architect guidance

- Route architecture work to the shared system architect and dispatch skills.
- Remove the proposed profile map and duplicate task contract.
- Preserve the opt-in model rule and durable issue identity.

## 2026-10-15: Office toolset and Node.js LTS policy

## 2026-10-18: Documentation consistency review

- Route readers to the current core map and owning procedures.
- Clarify historical guidance and remove conflicting document copies where applicable.

## 2026-10-18: Shared instruction references

- Link shared workspace rules instead of repeating them in repository guides.
- Keep local commands, checks, and README diagrams.

- Record the office installation checks and their limits.
- Link the shared Node.js LTS target and the remaining rollout work.

## 2026-10-15: Adversarial update review

- Define the evidence terms for the update workflow review.
- Keep each core repository note short and scoped to its responsibility.

## 2026-10-15: Development tool checks

- Add the dotfiles doctor and installer stage before application updates.
- Document ownership, startup commands, sudo rules and the process diagram.
- Keep the full procedure in workspace and short guides in core READMEs.

## 2026-10-15: Updater 1.0.001

- Documented core repository sync before release and application checks.
- Documented local work restoration and the exception to commit/push delivery.
- Documented the updater release sequence through patch 999.

## 2026-10-12 Home and work computers

- docs/ste-delivery.md tells where to get `rg` on both computers: RHEL 10 at home and Fedora Asahi Remix at work.

## 2026-10-11 Website artifact intent

- Added docs/website-artifact-intent.md with the current implementation, adoption tasks, source authority and acceptance checks.
- This proposal does not change application code, dependencies, data or publishing.

## [2026-09-13] — GitHub delivery cleanup

### Changed

- Reviewed GitHub delivery configuration for this repository.
- Added minimal protection to the default branch. Direct commits and pushes remain allowed; pull requests, reviews, status checks, and agent approvals are not required.
- Preserved project-specific validation and intentional publishing workflows.
