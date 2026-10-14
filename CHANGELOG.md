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
