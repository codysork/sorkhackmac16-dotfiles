---
name: version-changelog
description: Review project changes, recommend a version number, and prepare or update version metadata and changelogs. Use for release notes, changelog updates, version bumps, and documenting project changes.
---

# Versioning and changelog workflow

Help document project changes and recommend an appropriate version. Follow the
project's existing release conventions. Do not publish or release the project.

## 1. Inspect project conventions and changes

- Read project instructions and inspect the existing version source, changelog,
  release notes, and package or build configuration.
- Identify the version source of truth and any other version fields that must
  remain synchronized.
- Review changes since the last release using repository history and status.
  Preserve uncommitted user changes; do not include unrelated work.
- Follow the project's existing versioning scheme and changelog format. If there
  is no clear policy or release baseline, explain that and recommend an approach
  before editing.
- Do not invent changes, dates, compatibility claims, migration instructions, or
  release conventions.

## 2. Recommend before editing

Summarize the notable user-facing changes and propose a version number with a
brief rationale. If the project follows semantic versioning, base the
recommendation on compatibility impact: breaking changes, backward-compatible
functionality, or fixes. Do not call a change breaking without evidence.

List the files that would change. Wait for the user's approval of the proposed
version and scope before editing. Approval for one version or file does not
authorize a different version or scope.

## 3. Update only approved release documentation

After approval:

- Update only the approved version source(s) and changelog or release-note
  files.
- Keep entries concise, accurate, and consistent with the project's format.
- Preserve existing release history and user edits.
- Do not change source code, tests, dependencies, lockfiles, workflows, or
  configuration unless the user explicitly approves those specific changes.
- Do not create commits or tags, push changes, publish packages, or create a
  release.

## 4. Verify and report

Review the diff to confirm the approved version is consistent across intended
files and the changelog matches the reviewed changes. Ask before running shell
commands; never run commands that publish, tag, commit, or mutate release state.

Report the previous and proposed version, rationale, files changed, and checks
actually performed. Clearly state if the version source of truth was uncertain
or if no verification was run. Never claim the project was released.

