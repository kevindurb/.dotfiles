# GitHub CLI Commands Reference

## Quick View Commands

### Get PR Overview
```bash
gh pr view <number> --json reviews,comments,latestReviews,title,body,author
```

**Available JSON fields:**
- `reviews` - All reviews with state and body
- `latestReviews` - Most recent review from each reviewer
- `comments` - Issue comments (general discussion)
- `reviewRequests` - Pending review requests
- `reviewDecision` - Overall decision (APPROVED/CHANGES_REQUESTED/REVIEW_REQUIRED)

### View with Comments Flag
```bash
gh pr view <number> --comments
```
Shows PR details plus comment threads in human-readable format.

## Detailed API Commands

### Get All Reviews
```bash
gh api repos/{owner}/{repo}/pulls/{pull_number}/reviews
```

**Response fields:**
- `id` - Review ID
- `user` - Reviewer info
- `body` - Review summary text
- `state` - APPROVED, CHANGES_REQUESTED, COMMENTED, DISMISSED
- `submitted_at` - Timestamp
- `commit_id` - Commit being reviewed

### Get Review Comments (Inline Code Comments)
```bash
gh api repos/{owner}/{repo}/pulls/{pull_number}/comments
```

**Response fields:**
- `id` - Comment ID
- `path` - File path
- `position` - Position in diff (can be null for outdated)
- `original_position` - Original position
- `line` - Line number in file
- `original_line` - Original line (for outdated comments)
- `diff_hunk` - Surrounding code context
- `body` - Comment text
- `user` - Commenter info
- `created_at` / `updated_at` - Timestamps
- `in_reply_to_id` - For threaded replies

### Get Comments for Specific Review
```bash
gh api repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments
```

### Get Issue Comments (General PR Comments)
```bash
gh api repos/{owner}/{repo}/issues/{issue_number}/comments
```

**Note:** PR number = Issue number for this endpoint.

**Response fields:**
- `id` - Comment ID
- `user` - Commenter info
- `body` - Comment text
- `created_at` / `updated_at` - Timestamps

## Posting Comments/Reviews

### Add Issue Comment
```bash
gh pr comment <number> --body "Your comment text"
```

### Submit Review
```bash
# Approve
gh pr review <number> --approve --body "LGTM! Great work."

# Request changes
gh pr review <number> --request-changes --body "Please address these issues..."

# Comment only
gh pr review <number> --comment --body "Some thoughts on this..."
```

### Reply to Review Comment (via API)
```bash
gh api repos/{owner}/{repo}/pulls/{pull_number}/comments \
  -f body="Your reply" \
  -F in_reply_to_id=<comment_id>
```

## Filtering and Pagination

### With JQ Filtering
```bash
gh api repos/{owner}/{repo}/pulls/{pull_number}/comments \
  --jq '.[] | select(.path == "src/main.go")'
```

### Pagination
```bash
# API endpoints support per_page and page params
gh api repos/{owner}/{repo}/pulls/{pull_number}/comments \
  -f per_page=100 -f page=1
```

## Repository Context

When in a git repository, `gh` auto-detects `{owner}` and `{repo}`.

To specify explicitly:
```bash
gh pr view <number> --repo owner/repo
gh api repos/owner/repo/pulls/123/reviews
```
