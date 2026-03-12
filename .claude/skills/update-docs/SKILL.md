---
name: update-docs
description: Manually trigger the docs-updater agent to update CHANGELOG.md and README.md after an incremental build.
argument-hint: "[optional: brief description of what was implemented]"
---

Delegate immediately to the `docs-updater` agent.

Pass `$ARGUMENTS` as additional context to the agent if provided (e.g. a brief description of what was just implemented).

Do not perform the documentation update yourself — use the Agent tool to invoke `docs-updater` and let it handle everything.