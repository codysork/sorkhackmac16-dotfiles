---
name: clean-refactor
description: Refactor existing code to improve readability and maintainability while preserving behavior. Use for cleanup, simplification, or reducing duplication and unnecessary complexity.
---

# Clean, readable refactoring

Improve the code’s clarity without changing its externally observable behavior.
Prefer the project’s established conventions over personal style preferences.

## Harness: establish a safe baseline

1. Read project instructions and inspect the target code, its callers, relevant
   tests, and nearby examples of local style.
2. Check the working tree and relevant diffs. Preserve existing user changes.
3. Identify the behavior, interfaces, error handling, and side effects that the
   refactor must preserve.
4. If behavior or scope is materially unclear, ask a focused question. Otherwise
   state the assumption and propose a brief plan.
5. Before running commands or editing files, follow the selected agent’s
   permission and approval requirements.

## Refactor for clarity

- Prefer straightforward code that makes intent easy to follow.
- Use descriptive, consistent names. Avoid vague names, misleading distinctions,
  and unnecessary abbreviations.
- Reduce needless complexity and duplication, but do not abstract similar code
  unless the abstraction makes the design easier to understand or change.
- Keep related responsibilities together and unrelated responsibilities
  separate. Avoid both oversized units and fragmentation into tiny helpers that
  obscure the flow.
- Make control flow and important conditions clear. Use explanatory variables
  when they improve understanding; avoid extra indirection when they do not.
- Keep comments useful: explain intent, constraints, non-obvious behavior, or
  risks—not code that is already clear. Do not remove comments that preserve
  important context.
- Prefer local conventions and idiomatic language features. Do not introduce
  new patterns, dependencies, or configurability just for stylistic preference.
- Address only the requested area. Avoid unrelated cleanup and scope expansion.

## Preserve behavior

- Do not intentionally change public interfaces, outputs, data formats, ordering,
  error behavior, or side effects.
- Do not weaken, delete, or skip tests to make a refactor pass.
- If existing tests do not cover behavior at risk, identify the gap. Add or
  update tests only when requested and permitted by the active agent.
- Make small, reviewable changes so behavior regressions are easier to detect.

## Verify and review

1. Run the narrowest relevant checks before and after the change, subject to
   available tools and approval requirements.
2. Review the final diff for unintended behavior changes, unrelated edits,
   needless abstractions, and comments that no longer match the code.
3. Report what changed, what behavior was intended to remain unchanged, and
   which checks actually ran. State clearly when verification was unavailable.

Do not claim a refactor is behavior-preserving beyond what the inspected code and
verification support.

