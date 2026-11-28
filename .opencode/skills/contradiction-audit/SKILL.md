---
name: contradiction-audit
description: Find and report logical contradictions across documentation, specifications, requirements, policies, or related project files. Use when asked to audit, review, compare, or reconcile written requirements.
---

# Contradiction Audit

Review the requested documents for claims that cannot all be true under the same conditions. This is a read-only audit: do not edit the source files.

## Workflow

1. **Set the scope**
   - Identify the files, directories, or document set the user asked you to review.
   - If the scope is broad, inspect likely documentation and specification files first; state what you reviewed.
   - Note explicit versions, dates, audiences, environments, and product or feature boundaries.

2. **Collect claims**
   - Read the relevant documents and identify statements that impose rules, requirements, facts, limits, or behaviors.
   - Search for related terminology and equivalent wording, not just exact phrase matches.
   - Preserve the conditions attached to each claim: actor, action, object, time, environment, exceptions, and modality (for example, *must*, *may*, or *should*).
   - Record exact excerpts and file paths. Include line numbers when available.

3. **Test for a real contradiction**
   - Compare claims only after aligning their scope and conditions.
   - Report a contradiction when two claims cannot both hold in the same applicable case.
   - Check whether an apparent conflict is actually explained by different versions, audiences, environments, precedence rules, exceptions, or definitions.
   - Distinguish direct contradictions from ambiguity, missing information, inconsistency in terminology, and implementation risk.
   - Do not infer unstated requirements or treat silence as a conflicting claim.

4. **Verify each candidate**
   - Re-read both passages in context.
   - Confirm each excerpt supports the interpretation you describe.
   - Check nearby definitions, notes, exceptions, and references that could resolve the conflict.
   - If the conflict depends on an assumption, name that assumption and label the finding as tentative rather than certain.
   - Do not choose which statement is correct unless the documents establish precedence or the user asks you to assess authority.

5. **Report findings**
   - Rank confirmed contradictions by practical impact, then list tentative conflicts and related clarity issues separately.
   - For every finding, provide:
     - **Type:** direct contradiction, tentative conflict, ambiguity, or terminology mismatch
     - **Locations:** file paths and line numbers when available
     - **Evidence:** short, exact excerpts from both passages
     - **Why they conflict:** the shared conditions under which the claims cannot both hold
     - **Impact:** what a reader, implementer, or operator could misunderstand
     - **Resolution needed:** a neutral question or decision for the document owner
   - If you find no contradictions, say so and briefly state the scope reviewed. Do not imply that unreviewed files were checked.

## Output format

### Summary
State the scope and the number of confirmed contradictions, tentative conflicts, and clarity issues.

### Findings
For each finding, use the fields listed above. Keep excerpts short and faithful to the source.

### Not found
If applicable, state that no contradictions were found in the reviewed scope and note any relevant limitations.

## Guardrails

- Be evidence-led: every contradiction finding must cite two or more specific claims.
- Keep quotations brief; do not rewrite them in a way that changes their meaning.
- Do not report a difference in wording as a contradiction unless it changes what is required, allowed, or asserted.
- Do not silently resolve conflicts by preferring newer-looking, more detailed, or more prominent text.
- Treat recommendations and requirements differently; preserve modal language.
- Avoid proposing a fix unless asked. If asked, offer neutral alternatives and identify the decision the owner must make.
- Do not modify files, create patches, or claim to have checked documents you could not access.

