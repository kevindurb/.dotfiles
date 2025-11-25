# GitHub CLI Common Commands

Comprehensive reference for `gh` CLI operations.

## Pull Requests

### Viewing & Listing

```bash
# View a specific PR
gh pr view <number>
gh pr view <number> --json title,body,state,author

# List PRs
gh pr list
gh pr list --state open
gh pr list --author <username>
gh pr list --label <label>
gh pr list --json number,title,state
```

### Creating PRs

```bash
# Create PR interactively
gh pr create

# Create with title and body
gh pr create --title "Title" --body "Description"

# Create with heredoc for multiline body
gh pr create --title "Add feature" --body "$(cat <<'EOF'
## Summary
- Added new feature
- Fixed bugs

## Test plan
- [ ] Test case 1
- [ ] Test case 2
EOF
)"

# Create draft PR
gh pr create --draft --title "WIP: Feature"

# Set base branch
gh pr create --base develop --title "Feature"
```

### PR Operations

```bash
# Checkout a PR locally
gh pr checkout <number>

# Review a PR
gh pr review <number>
gh pr review <number> --approve
gh pr review <number> --request-changes --body "Please fix..."
gh pr review <number> --comment --body "LGTM"

# Merge a PR
gh pr merge <number>
gh pr merge <number> --squash
gh pr merge <number> --rebase
gh pr merge <number> --merge

# Close/reopen PR
gh pr close <number>
gh pr reopen <number>

# Ready a draft PR
gh pr ready <number>

# View PR diff
gh pr diff <number>

# View PR checks
gh pr checks <number>
```

### PR Comments

```bash
# View comments
gh api repos/{owner}/{repo}/pulls/{number}/comments

# Add comment via API
gh api repos/{owner}/{repo}/issues/{number}/comments -f body="Comment text"
```

## Issues

### Viewing & Listing

```bash
# View an issue
gh issue view <number>
gh issue view <number> --json title,body,state,labels

# List issues
gh issue list
gh issue list --state open
gh issue list --label bug
gh issue list --assignee <username>
gh issue list --author <username>
```

### Creating & Managing Issues

```bash
# Create issue
gh issue create --title "Bug title" --body "Description"

# Create with labels and assignees
gh issue create --title "Bug" --body "Description" --label bug --assignee <username>

# Close/reopen issue
gh issue close <number>
gh issue reopen <number>

# Edit issue
gh issue edit <number> --title "New title"
gh issue edit <number> --add-label "bug"
gh issue edit <number> --add-assignee <username>
```

## Repository Operations

### Viewing & Cloning

```bash
# View repository info
gh repo view
gh repo view owner/repo
gh repo view --json name,description,url,isPrivate

# Clone repository
gh repo clone owner/repo
gh repo clone owner/repo path/to/dir

# Fork repository
gh repo fork owner/repo
gh repo fork owner/repo --clone
```

### Repository Management

```bash
# Create repository
gh repo create my-repo --public
gh repo create my-repo --private
gh repo create my-repo --source=. --push

# Archive repository
gh repo archive owner/repo

# Delete repository (requires confirmation)
gh repo delete owner/repo

# Set default branch
gh repo edit --default-branch main
```

## Workflows (GitHub Actions)

### Viewing Workflows

```bash
# List workflows
gh workflow list

# View workflow runs
gh run list
gh run list --workflow=ci.yml
gh run list --branch main
gh run list --status failure

# View specific run
gh run view <run-id>
gh run view <run-id> --log
gh run view <run-id> --job <job-id>
```

### Managing Runs

```bash
# Rerun a workflow
gh run rerun <run-id>

# Cancel a run
gh run cancel <run-id>

# Watch a run
gh run watch <run-id>

# Download artifacts
gh run download <run-id>
```

## Releases

```bash
# List releases
gh release list

# View a release
gh release view <tag>

# Create release
gh release create v1.0.0 --title "Version 1.0.0" --notes "Release notes"
gh release create v1.0.0 --generate-notes

# Upload assets
gh release upload v1.0.0 file1.zip file2.tar.gz

# Download release assets
gh release download v1.0.0
gh release download v1.0.0 --pattern "*.zip"

# Delete release
gh release delete v1.0.0
```

## Gists

```bash
# Create gist
gh gist create file.txt
gh gist create file1.txt file2.txt --public

# List gists
gh gist list

# View gist
gh gist view <gist-id>

# Edit gist
gh gist edit <gist-id>

# Clone gist
gh gist clone <gist-id>
```

## API Access

### Making API Calls

```bash
# GET request
gh api repos/{owner}/{repo}
gh api users/{username}

# POST request
gh api repos/{owner}/{repo}/issues -f title="Title" -f body="Body"

# With JSON input
gh api repos/{owner}/{repo}/issues --input payload.json

# Pagination
gh api repos/{owner}/{repo}/issues --paginate
```

### Common API Endpoints

```bash
# Repository info
gh api repos/{owner}/{repo}

# Pull request comments
gh api repos/{owner}/{repo}/pulls/{number}/comments

# Issue comments
gh api repos/{owner}/{repo}/issues/{number}/comments

# Workflow runs
gh api repos/{owner}/{repo}/actions/runs

# Repository contents
gh api repos/{owner}/{repo}/contents/{path}

# User info
gh api user
gh api users/{username}
```

## Authentication

```bash
# Check auth status
gh auth status

# Login
gh auth login
gh auth login --with-token < token.txt

# Logout
gh auth logout

# Switch accounts
gh auth switch

# Refresh authentication
gh auth refresh

# Setup git credential helper
gh auth setup-git
```

## Configuration

```bash
# Set default editor
gh config set editor vim

# Set default protocol (https/ssh)
gh config set git_protocol ssh

# Set default browser
gh config set browser firefox

# View configuration
gh config list

# Get specific config value
gh config get editor
```

## Aliases

```bash
# Create alias
gh alias set pv 'pr view'
gh alias set co 'pr checkout'

# List aliases
gh alias list

# Delete alias
gh alias delete pv
```

## Search

```bash
# Search issues
gh search issues "bug" --repo owner/repo

# Search PRs
gh search prs "feature" --repo owner/repo

# Search code
gh search code "function foo" --repo owner/repo

# Search repos
gh search repos "topic:javascript"
```

## Output Formatting

```bash
# JSON output
gh pr list --json number,title,state

# JQ integration
gh pr list --json number,title | jq '.[] | select(.number == 123)'

# Template output
gh pr list --template '{{range .}}{{.number}} - {{.title}}{{"\n"}}{{end}}'

# Limit output
gh pr list --limit 10
```

## Common Patterns

### Check if PR exists for current branch

```bash
gh pr view --json number 2>/dev/null || echo "No PR found"
```

### Create PR if it doesn't exist

```bash
if ! gh pr view --json number >/dev/null 2>&1; then
  gh pr create --title "..." --body "..."
fi
```

### Get PR number for current branch

```bash
PR_NUMBER=$(gh pr view --json number -q .number)
```

### List all open PRs with specific label

```bash
gh pr list --label "needs-review" --state open
```

### Get all comments on a PR

```bash
gh api repos/{owner}/{repo}/pulls/{number}/comments --paginate
```
