---
name: human-review
description: Prepare a human-review packet for spec files and review AI-generated code or documentation against repository marker rules. Use when reviewing specs, checking AI-generated work, or handing artifacts to a human reviewer; makes no edits unless explicitly approved.
---

# Human review workflow

Support the human reviewer; never replace their judgment. Gather evidence, report
findings, and leave decisions to the reviewer. Do not edit reviewed artifacts
unless the user explicitly approves a specific change.

## 1. Establish scope and rules

- Read the project's instructions, including nested `AGENTS.md` files, before reviewing.
- Identify the artifacts in scope: spec files, the scripts and tests they describe, and any AI-generated files that carry review markers.
- Check Git status and relevant diffs. Preserve pre-existing user changes.
- Ask when the scope or the applicable review standard is unclear. Ask before running shell commands.

## 2. Build the spec review packet

For each spec, compare the contract with the code and configuration it describes:

- JSON syntax and validity against the repository's schema; report when no validator is available instead of claiming validation.
- Script path exists; invocation, arguments, environment, effects, and exit codes match the script's real behavior.
- Policy fields (network, hosts, write paths, sudo, destructive): flag any broadening and require explicit approval; flag narrow or tailored policies that contradict a script.
- Tests: commands are safe to run, and expected exit codes match observed results.
- Cross-file consistency: no duplicate, missing, or conflicting entries; schema version matches the schema.

Classify each finding as a verified conflict, a verified fact, or a possible risk.
Do not present a risk as a conflict. Cite file paths and line numbers.

## 3. Review AI-generated work and markers

- Apply the marker rules actually in force for each file, as written in its governing `AGENTS.md`; nested rules may differ.
- Check that AI-generated functions, code blocks, and documentation blocks carry the exact required marker immediately above them, using the correct comment syntax for the file type (for example `#` in shell, `<!-- ... -->` in Markdown).
- Flag missing, misplaced, duplicated, or stale markers, and any marker removed before a human reviewed the block.
- Where a file type has no comment syntax, say so; do not introduce syntax that would break the file.
- Markers may be cleared only after a human confirms review of that specific block. Never clear them on the reviewer's behalf.

## 4. Present findings for decision

- Summarize what was checked, group findings by severity, and list assumptions and open questions separately.
- Give repeatable verification steps with expected results. Report only checks that were actually run; never claim tests passed or a spec was implemented unless verified.
- State clearly that nothing was changed and that no approval is implied.
- Ask for a decision on each open question and wait. Approval for one file or change does not authorize another.

## 5. Apply only approved edits

- Change only the named artifacts and only the agreed findings.
- Re-run the relevant validation and report exact results.
- Preserve recorded decisions; do not silently revisit them in later reviews.
