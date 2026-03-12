---
name: tag-release
description: Manually trigger the release-tagger agent to create a git tag for the current commit.
argument-hint: "[version] [optional: message]"
---

Delegate immediately to the `release-tagger` agent.

Pass `$ARGUMENTS` directly to the agent as the version and optional message (e.g. `v0.2.0` or `v0.2.0 "Forms milestone complete"`).

Do not perform the tagging yourself — use the Agent tool to invoke `release-tagger` and let it handle everything.