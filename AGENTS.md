# Agent guidance

## Working agreements

- Check the current branch and `git status`, and preserve unrelated changes.
- Keep changes focused on the requested scope.
- Do not commit, push, or open a pull request unless explicitly asked.

## Verification

Run checks relevant to the changed code:

```bash
flutter analyze
flutter test
```

Format changed Dart files with `dart format`.

## Commits

Use Conventional Commits in English:

```text
<type>(<optional-scope>): <imperative summary>
```

## AI attribution

For non-trivial AI-assisted commits, add:

```text
Assisted-by: <agent>
```

Include the model only when it is explicitly known:

```text
Assisted-by: <agent>:<model>
```

## Pull requests

Before drafting or creating a pull request, read
`.github/PULL_REQUEST_TEMPLATE.md` and use it as a reference.
