# AGENTS.md

Scope: the dotfiles repository rooted at `$HOME` (`/home/cody`).

## Git flow

- **Branch strategy:** work directly on the current branch, `master` (the
  repo's only branch; `origin`'s default). Don't create new branches unless
  you ask.
- **Commit conventions:** short, past-tense messages in the style of the
  existing history ("Removed todo stress display", "Added aliases", ...).
  Keep the subject to one line where possible; add a short body only when the
  change needs explaining.
- **Testing:** there is no automated test suite for the dotfiles repo. For
  changes under `.todo/` (see `.todo/AGENTS.md`): run `bash -n` on edited
  shell files, run `shellcheck` when available, and verify the todo.sh
  contract with a scratch config (`todo.sh -d /tmp/todo-test.cfg help
  <name>`, `todo.sh listaddons`, ...). For shell/dotfile edits, confirm they
  parse (`bash -n`) or load.
- **Push/merge/PR:** don't push, merge or open pull requests without asking
  first. The remote is `origin`; those decisions are yours to make unless
  you specify otherwise.
