---
name: ci-spec-gate
description: Design, update, or run CI gates for spec-driven development. Use when mapping specifications to tests, defining merge criteria, reviewing CI workflows, or checking whether a feature is ready to advance through review, develop, and master.
---

# Spec-Driven CI Gate

Use this skill to make CI verify the agreed specification—not merely that the code compiles. Adapt to the repository’s existing CI provider, scripts, conventions, and specification format. Do not assume specific tools, file paths, commands, or coverage thresholds.

## 1. Discover the project's sources of truth

Before proposing or running checks, inspect:

- Repository instructions and contributor guidance.
- The relevant feature specification, acceptance criteria, and any linked design decisions.
- Existing CI workflows, build and test scripts, and branch protection conventions.
- The current branch, changed files, and available tests.

Treat the accepted specification as the source of expected behavior. If requirements conflict, are ambiguous, or lack acceptance criteria, report the gap instead of inventing behavior. Do not treat implementation behavior as proof that the implementation matches the spec.

## 2. Establish requirement-to-test traceability

For each changed requirement, identify:

- A stable requirement or acceptance-criterion identifier, if the project has one.
- The behavior or constraint that must hold.
- The automated check that verifies it, or why verification is currently manual.
- The result and any uncovered cases.

Prefer a small traceability summary in the project's existing format. Do not introduce a new tracking system without a project need. Flag changed requirements with no verification and tests that no longer correspond to the current spec.

## 3. Build the gate from existing project checks

Use the commands and tools defined by the project. Organize checks into useful stages, such as:

1. **Fast checks:** formatting, lint, type checks, and static validation.
2. **Build checks:** compile or package the project.
3. **Behavior checks:** unit and integration tests mapped to requirements.
4. **Acceptance checks:** end-to-end or contract tests for user-visible and cross-component behavior.
5. **Release checks:** compatibility, migration, packaging, and documentation checks when relevant.

Run only checks that exist or are explicitly being added. Never claim a check passed if it was skipped, unavailable, or not run.

## 4. Require reliable test harnesses

Tests should be repeatable, isolated, and safe:

- Use temporary directories and disposable fixtures for file or database operations.
- Do not use real user data, production credentials, or shared mutable environments.
- Avoid depending on network access, wall-clock time, machine-specific paths, locale, or execution order unless the specification requires it; control or explicitly document such dependencies.
- Verify observable behavior and outputs, not private implementation details, where practical.
- Include relevant edge cases, failure paths, and regression cases from the specification.
- Keep generated artifacts and test data from contaminating the working tree.
- Make test failures actionable: show the requirement or scenario that failed.

For todo.txt or other plain-text task-data changes, check applicable requirements for parsing, writing, round-tripping, malformed input, compatibility, and preservation of existing data. Use isolated temporary files; never run data-modifying tests against a user's actual task list.

## 5. Define branch-appropriate gates

Respect the repository's documented branch flow. For a flow such as
`feature → review → develop → master`:

- **Feature to review:** require the relevant spec, acceptance criteria, and tests to be present; run fast checks and applicable behavior tests.
- **Review to develop:** require human review and all required CI checks to pass; resolve blocking findings and spec/test mismatches.
- **Develop to master:** require a release-ready candidate, green required checks on the exact candidate commit, compatibility and migration review where applicable, and release documentation required by the project.

Do not merge, push, tag, deploy, alter branch protections, or bypass required checks. Report readiness and let authorized humans perform release actions.

## 6. Fail closed and report clearly

A required check that fails, is skipped, or cannot run is not a pass. Do not weaken a gate, lower a threshold, disable a test, or change a specification merely to obtain a green result. If the spec itself needs revision, identify that as a decision for the responsible human.

Return a concise report with:

- **Verdict:** PASS, FAIL, or BLOCKED.
- **Scope:** branch, commit, changed requirements, and target branch if known.
- **Traceability:** requirement-to-check mapping and uncovered requirements.
- **Checks:** command or CI job, status, and brief result.
- **Findings:** actionable issues, ordered by severity, with file references where available.
- **Next step:** the smallest action needed to resolve each blocker.

Use PASS only when all applicable required checks pass, changed requirements are adequately verified, and no blocking spec or compatibility gaps remain. Use BLOCKED when a required check cannot be run or a decision is needed.

