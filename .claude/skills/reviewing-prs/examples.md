# Usage Examples

## Example 1: Get PR Overview

```bash
gh pr view 12158 --repo cli/cli --json reviews,latestReviews,title,author,reviewDecision
```

**Output structure:**
```json
{
  "author": {
    "login": "andyfeller",
    "name": "Andy Feller"
  },
  "title": "Polish Debian development user experience",
  "reviewDecision": "APPROVED",
  "reviews": [
    {
      "id": "PRR_kwDODKw3uc7PPmfa",
      "author": {"login": "babakks"},
      "body": "Thanks for the improvements, @andyfeller! 🙏",
      "state": "APPROVED",
      "submittedAt": "2025-11-18T10:49:12Z"
    }
  ]
}
```

## Example 2: Get Detailed Reviews

```bash
gh api repos/cli/cli/pulls/12158/reviews --jq '.[] | {id, user: .user.login, state, body}'
```

**Output:**
```json
{
  "id": 3476973530,
  "user": "babakks",
  "state": "APPROVED",
  "body": "Thanks for the improvements, @andyfeller! 🙏"
}
```

## Example 3: Get Review Comments (Inline Code Comments)

```bash
gh api repos/cli/cli/pulls/12158/comments --jq '.[] | {path, line, body, diff_hunk}'
```

**Output:**
```json
{
  "path": "script/debian-devel",
  "line": 400,
  "body": "Loved it! 🥇",
  "diff_hunk": "@@ -343,45 +365,43 @@ Expire-Date: seconds=$((15 * 60))\n..."
}
```

**Key fields:**
- `path` - File being commented on
- `line` / `start_line` - Line number(s)
- `diff_hunk` - Surrounding code context
- `body` - The comment text
- `position` - Position in diff (null if outdated)
- `in_reply_to_id` - ID of parent comment (for threaded replies)

## Example 4: Pretty-Print All Review Comments

```bash
gh api repos/cli/cli/pulls/12158/comments --jq '.[] |
  "\n📝 \(.user.login) on \(.path):\(.line)\n   \(.body)\n"'
```

**Output:**
```
📝 babakks on script/debian-devel:400
   Loved it! 🥇
```

## Example 5: Filter Comments by File

```bash
gh api repos/owner/repo/pulls/123/comments --jq '
  .[] | select(.path == "src/main.go") | {line, body, user: .user.login}
'
```

## Example 6: Show All Feedback for a PR

Combine multiple commands for complete view:

```bash
#!/bin/bash
PR_NUM=12158
REPO="cli/cli"

echo "=== PR Overview ==="
gh pr view $PR_NUM --repo $REPO --json title,author,state,reviewDecision

echo -e "\n=== Reviews ==="
gh api repos/$REPO/pulls/$PR_NUM/reviews --jq '.[] |
  "[\(.state)] \(.user.login): \(.body)"'

echo -e "\n=== Review Comments ==="
gh api repos/$REPO/pulls/$PR_NUM/comments --jq '.[] |
  "📝 \(.path):\(.line) - \(.user.login)\n   \(.body)\n"'

echo -e "\n=== Discussion Comments ==="
gh api repos/$REPO/issues/$PR_NUM/comments --jq '.[] |
  "💬 \(.user.login) at \(.created_at)\n   \(.body[0:100])...\n"'
```

## Example 7: Respond to Review Comment

### Reply to inline comment:
```bash
gh api repos/owner/repo/pulls/123/comments \
  -f body="Thanks for the feedback! I've updated this." \
  -F in_reply_to_id=2537501804
```

### Add general PR comment:
```bash
gh pr comment 123 --repo owner/repo --body "I've addressed all the review comments."
```

### Submit review:
```bash
# Approve
gh pr review 123 --repo owner/repo --approve --body "LGTM! Great work."

# Request changes
gh pr review 123 --repo owner/repo --request-changes \
  --body "Please address the issues in main.go"
```

## Presentation Template

When showing PR feedback to the user, format like this:

```
# PR #123: Feature Title

**Status:** CHANGES_REQUESTED
**Author:** @username

## Reviews

### @reviewer1 - APPROVED (2025-11-18)
Great work overall! Just a few minor suggestions.

### @reviewer2 - CHANGES_REQUESTED (2025-11-18)
Please address the following issues before merging.

## Review Comments (Inline)

### src/main.go

**Line 42** (@reviewer2):
> This function could be simplified. Consider using...

```diff
- old code
+ suggested code
```

**Line 98** (@reviewer1):
> Nice optimization here! 🚀

## Discussion Comments

**@maintainer** (2025-11-17):
Thanks for the contribution! Please make sure all tests pass.

**@author** (2025-11-17):
Will do! Working on it now.
```

## Tips

1. **Use `--jq` for filtering** - Extract only what you need
2. **Check `position` field** - `null` means comment is outdated
3. **Group by file** - Makes inline comments easier to navigate
4. **Show diff_hunk** - Provides context for inline comments
5. **Track `in_reply_to_id`** - Reconstruct comment threads
