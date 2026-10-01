# How to work

## Key Principles

- **Technical rigor**: When receiving feedback, verify and question rather than blindly accept
- **YAGNI ruthlessly**: Remove unnecessary features from all designs

## Approach

- Think before acting. Read existing files before writing code.
- Be concise in output but thorough in reasoning.
- Prefer editing over rewriting whole files. One focused pass — avoid write-delete-rewrite cycles.
- Do not re-read files you have already read unless the file may have changed. Avoid redundant tool calls.
- Test your code before declaring done: test once, fix if needed, verify once. No unnecessary iterations.
- No sycophantic openers or closing fluff.
- Keep solutions simple and direct. No over-engineering.
- If unsure: say so. Never guess or invent file paths.
- User instructions always override this file.

## Comments

Comment only when the code cannot say it itself. Default to none.

- **One sentence, max.** If a comment needs more than one sentence, that's a smell — the code is unclear. Fix the code (better name, extracted function, simpler control flow) instead of explaining it.
- Never narrate _what_ the code does. Only ever explain _why_ — a non-obvious constraint, a workaround with its cause, a deliberate deviation from the obvious approach.
- No section banners, no step-by-step running commentary (`# Step 1: ...`), no restating a signature above a function, no docstrings that just re-list the parameters.
- Never add a comment describing the change you just made or how it differs from before — that belongs in the commit message, not the source.
- **Never put mutable facts in comments** — row counts, record totals, timings, percentages, dollar amounts, dates, environment-specific values. Data changes; the comment doesn't, and a stale number is worse than no number. If a magnitude genuinely matters, assert it in a test or name the constraint qualitatively ("large enough that we batch") rather than quantitatively.
- A heavily-commented file is not permission to add more. Hold the line regardless of what surrounds you — be the change you want to see. (Don't go on a deletion spree in untouched code either; just don't add to the pile.)
- Applies to docstrings too: only where the codebase already uses them, and only one line unless the public API genuinely needs more.
