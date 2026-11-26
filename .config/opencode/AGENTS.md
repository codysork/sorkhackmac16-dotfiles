# AGENTS.md

> Extracted from the root `AGENTS.md`; keep the two in sync.

**1. Always find the root cause of a problem.**
**2. Keep it simple stupid; reduce complexity as much as possible.**
**3. Leave the campground cleaner than you found it.**
**4. Verify your changes: there is no automated test suite for this repo; verify with manual smoke checks.**

<!-- AI-generated documentation (not reviewed by a human) -->
## AI review tags

**Every AI-generated function or code block—including tests—MUST have a
comment immediately above it that says exactly: `AI-generated code
(unreviewed by a human)`.**

**Every AI-generated or agent-edited block of text—including documentation
and this file—MUST have a comment immediately above it that says exactly:
`AI-generated documentation (not reviewed by a human)`.**

Keep each marker until a human has reviewed the content; do not put markers
only at file level. Use `# ...` in Bash/Python/config and `<!-- ... -->`
in Markdown. In Python, place the code marker above the `def`/`class` and the
documentation marker above its docstring when both are generated.

<!-- AI-generated documentation (not reviewed by a human) -->
## Spec conformance

When a project has specs (for example `spec/*.spec.json` and its schema), treat
them as the contract. Read the relevant spec before writing or changing code,
and keep the code within its declared interface, effects, and exit codes. Never
relax a spec to make non-conforming code acceptable: fix the code instead. Only
create or update a spec when the user explicitly asks for a spec change. Verify
conformance after changes and report any mismatch instead of silently changing
the spec.

## Clean code standards

Clean code is easy for everyone on the team to understand, read, change, extend, and maintain.

Source: https://gist.githubusercontent.com/wojteklu/73c6914cc446146b8b533c0988cf8d29/raw/c7a44d774fc3b09a0d5f0f58888550ba0ac694b9/clean_code.md

### General principles

1. Follow standard conventions.
2. Keep it simple. Reduce complexity wherever possible.
3. Leave the campground cleaner than you found it.
4. Find and fix root causes.

### Design principles

1. Keep configurable data at a high level.
2. Prefer polymorphism to `if` / `else` or `switch` statements.
3. Separate multithreading code.
4. Avoid overconfigurability.
5. Use dependency injection.
6. Follow the Law of Demeter: a component should know only its direct dependencies.

### Understandability

1. Be consistent; handle similar things in similar ways.
2. Use explanatory variables.
3. Encapsulate boundary conditions in one place.
4. Prefer dedicated value objects to primitive types.
5. Avoid logical dependencies between methods.
6. Prefer positive conditionals.

### Naming

1. Choose descriptive, unambiguous names.
2. Make meaningful distinctions.
3. Use pronounceable and searchable names.
4. Replace magic numbers with named constants.
5. Avoid encodings such as type prefixes.

### Functions

1. Keep functions small and focused on one task.
2. Use descriptive names.
3. Prefer fewer arguments.
4. Avoid side effects.
5. Avoid flag arguments; use separate functions for distinct behaviors.

### Comments

1. Prefer clear code over comments.
2. Avoid redundant or obvious comments.
3. Do not add noise.
4. Do not add comments to closing braces.
5. Remove commented-out code.
6. Use comments to explain intent, clarify code, or warn about consequences.

### Source structure

1. Separate concepts vertically.
2. Keep related code close together.
3. Declare variables near where they are used.
4. Keep dependent and similar functions close together.
5. Order functions from higher-level to lower-level operations.
6. Keep lines short.
7. Avoid horizontal alignment.
8. Use whitespace to group related code and separate unrelated code.
9. Preserve consistent indentation.

### Objects and data structures

1. Hide internal structure.
2. Prefer data structures.
3. Avoid hybrids that mix object and data-structure behavior.
4. Keep components small and focused.
5. Limit the number of instance variables.
6. Base classes should know nothing about derived classes.
7. Prefer multiple focused functions to passing code into a function to select behavior.
8. Prefer non-static methods to static methods.

### Tests

1. Use one assertion per test.
2. Keep tests readable, fast, independent, and repeatable.

This project has no automated test suite on purpose: a small, simple codebase is preferred. Verify changes with manual pseudo-terminal smoke checks.

### Code smells

Watch for:

1. **Rigidity:** Small changes require many follow-up changes.
2. **Fragility:** A change breaks many unrelated parts.
3. **Immobility:** Reusing a component elsewhere requires excessive effort or risk.
4. Needless complexity.
5. Needless repetition.
6. Opacity: code that is difficult to understand.

Most important instructions, repeated: 1. find the root cause of a problem; 2. keep it simple and reduce complexity as much as possible; 3. leave the campground cleaner than you found it; 4. verify changes with manual smoke checks.
