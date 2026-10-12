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
