# Jira CLI Common Commands

Comprehensive reference for `jira` CLI operations.

## Issues

### Listing & Viewing

```bash
# List issues (interactive)
jira issue list

# List issues with filters
jira issue list -a$(jira me) -s~Done
jira issue list --type Bug --status "In Progress"
jira issue list --assignee "user@example.com"
jira issue list --label backend,api

# List with aliases
jira issue ls  # alias for list

# View specific issue
jira issue view PROJ-123
jira issue view PROJ-123 --comments 5

# List recent issues
jira issue list --history
jira issue list --created-after -7d
jira issue list --updated-after -1d
```

### Creating Issues

```bash
# Create issue interactively
jira issue create

# Create with command-line flags
jira issue create -tBug -s"Bug title" -b"Description" -yHigh
jira issue create -tStory -s"Story title" --body "Description"
jira issue create -tTask -s"Task title" -a$(jira me)

# Create with labels
jira issue create -tBug -s"Title" -lbackend -l"high prio"

# Create with body file
jira issue create -tStory -s"Title" --body-file description.txt
```

### Editing & Managing

```bash
# Edit issue (opens editor)
jira issue edit PROJ-123

# Update specific fields
jira issue edit PROJ-123 -s"New summary"
jira issue edit PROJ-123 --priority High
jira issue edit PROJ-123 --label +newlabel  # Add label
jira issue edit PROJ-123 --label -oldlabel  # Remove label

# Assign issue
jira issue assign PROJ-123 username
jira issue assign PROJ-123 $(jira me)  # Assign to self
jira issue assign PROJ-123 -x  # Unassign

# Delete issue
jira issue delete PROJ-123
```

### Workflow Transitions

```bash
# Move issue (workflow transition)
jira issue move PROJ-123  # Interactive - shows available transitions
jira issue move PROJ-123 "In Progress"
jira issue move PROJ-123 "Code Review"
jira issue move PROJ-123 Done
```

### Comments

```bash
# Add comment
jira issue comment add PROJ-123 "Comment text"
jira issue comment add PROJ-123 --comment-file comment.txt

# View comments
jira issue view PROJ-123 --comments 10
```

### Linking Issues

```bash
# Link issues
jira issue link PROJ-123 PROJ-456
jira issue link PROJ-123 PROJ-456 --link-type "blocks"
jira issue link PROJ-123 PROJ-456 --link-type "relates to"

# Unlink issues
jira issue unlink PROJ-123 PROJ-456
```

### Other Issue Operations

```bash
# Clone issue
jira issue clone PROJ-123

# Watch/unwatch issue
jira issue watch PROJ-123
jira issue watch PROJ-123 -x  # Unwatch

# Open issue in browser
jira open PROJ-123
```

## Sprint Management

### Listing Sprints

```bash
# List sprints in default board
jira sprint list

# List with table view
jira sprint list --table

# Filter by state
jira sprint list --state active
jira sprint list --state future
jira sprint list --state closed

# View specific sprint issues
jira sprint list 42  # Sprint ID
jira sprint list 42 --plain
```

### Managing Sprint Issues

```bash
# Add issues to sprint
jira sprint add 42 PROJ-123
jira sprint add 42 PROJ-123 PROJ-124 PROJ-125

# View sprint issues with filters
jira sprint list 42 --assignee $(jira me)
jira sprint list 42 --status "In Progress"
```

## Epic Management

### Listing & Viewing

```bash
# List epics
jira epic list

# List epics in table view
jira epic list --table

# View epic details
jira epic view PROJ-100

# View issues in epic
jira epic list PROJ-100
jira epic list PROJ-100 --plain
```

### Creating & Managing

```bash
# Create epic
jira epic create
jira epic create -n"Epic name" -s"Epic summary" -b"Description"

# Add issues to epic
jira epic add PROJ-100 PROJ-123
jira epic add PROJ-100 PROJ-123 PROJ-124 PROJ-125

# Remove issues from epic
jira epic remove PROJ-100 PROJ-123
```

## Board & Project Operations

### Boards

```bash
# List boards
jira board list

# View board details
jira board view 123
```

### Projects

```bash
# List projects
jira project list

# View project details
jira project view PROJ
```

## Search & Filters

### JQL Queries

```bash
# Use JQL for advanced searches
jira issue list --jql "project = PROJ AND status = 'In Progress'"
jira issue list --jql "assignee = currentUser() AND status != Done"
jira issue list --jql "created >= -7d"
jira issue list --jql "priority = High AND assignee = currentUser()"

# Complex JQL queries
jira issue list -q"project = PROJ AND status changed to 'Done' during (startOfDay(-7d), endOfDay())"
jira issue list -q"assignee = currentUser() AND status = 'In Progress' ORDER BY priority DESC"
```

### Common Filter Patterns

```bash
# My open issues
jira issue list -a$(jira me) -s~Done -s~Closed

# Issues by status
jira issue list --status "To Do"
jira issue list --status "In Progress,Code Review"

# Issues by type
jira issue list --type Bug
jira issue list --type "Story,Task"

# Issues by label
jira issue list --label backend
jira issue list --label "urgent,bug"

# Issues by priority
jira issue list --priority High
jira issue list --priority "Highest,High"

# Issues by component
jira issue list --component "API"

# Recently created/updated
jira issue list --created-after -7d  # Last 7 days
jira issue list --created-after -1w  # Last week
jira issue list --updated-after -1d  # Updated today

# Date range filters
jira issue list --created week  # This week
jira issue list --created month  # This month
jira issue list --created year  # This year

# Specific date
jira issue list --created 2025-01-01
jira issue list --created-before 2025-01-01
```

## Output Formatting & jq Integration

### JSON Output with --raw

```bash
# Get issue as JSON
jira issue view PROJ-123 --raw

# List issues as JSON
jira issue list --raw

# Parse with jq - extract specific fields
jira issue list --raw | jq '.issues[] | {key: .key, summary: .fields.summary, status: .fields.status.name}'

# Get issue keys only
jira issue list --raw | jq -r '.issues[].key'

# Filter by status in jq
jira issue list --raw | jq '.issues[] | select(.fields.status.name == "In Progress")'

# Count issues by status
jira issue list --raw | jq '.issues | group_by(.fields.status.name) | map({status: .[0].fields.status.name, count: length})'

# Get assignee names
jira issue list --raw | jq -r '.issues[] | "\(.key): \(.fields.assignee.displayName // "Unassigned")"'

# Extract custom fields
jira issue view PROJ-123 --raw | jq '.fields.customfield_10001'
```

### CSV Output

```bash
# Export issues to CSV
jira issue list --csv > issues.csv

# Export with filters
jira issue list --status Done --csv > completed.csv

# List sprints as CSV
jira sprint list --table --csv > sprints.csv

# List epics as CSV
jira epic list --table --csv > epics.csv
```

### Plain Text Output

```bash
# Plain table format (script-friendly, no colors)
jira issue list --plain

# With custom delimiter
jira issue list --plain --delimiter "|"
jira issue list --plain --delimiter ","

# Select specific columns
jira issue list --plain --columns key,summary,status,assignee
jira issue list --plain --columns type,key,priority,status

# Available columns:
# TYPE, KEY, SUMMARY, STATUS, ASSIGNEE, REPORTER, PRIORITY,
# RESOLUTION, CREATED, UPDATED, LABELS

# No headers (for piping)
jira issue list --plain --no-headers

# Show all fields
jira issue list --plain --no-truncate

# Combine options
jira issue list --plain --no-headers --columns key,status | while read key status; do
  echo "Issue $key is $status"
done
```

### Common jq Patterns

```bash
# Get all issue keys assigned to me
jira issue list -a$(jira me) --raw | jq -r '.issues[].key'

# Create table from JSON
jira issue list --raw | jq -r '.issues[] | [.key, .fields.status.name, .fields.summary] | @tsv'

# Issues updated in last 24 hours
jira issue list --updated-after -1d --raw | jq -r '.issues[] | "\(.key): \(.fields.summary)"'

# Get issue keys and assignees
jira issue list --raw | jq -r '.issues[] | "\(.key) - \(.fields.assignee.displayName // "Unassigned")"'

# Count issues by assignee
jira issue list --raw | jq '.issues | group_by(.fields.assignee.displayName) | map({assignee: (.[0].fields.assignee.displayName // "Unassigned"), count: length})'

# Get labels for all issues
jira issue list --raw | jq -r '.issues[] | "\(.key): \(.fields.labels | join(", "))"'
```

## Common Patterns

### Daily Workflow

```bash
# View my active sprint issues
jira sprint list --state active
SPRINT_ID=$(jira sprint list --state active --table --plain --no-headers --columns id | head -1)
jira sprint list "$SPRINT_ID" -a$(jira me)

# Start working on issue
ISSUE="PROJ-123"
jira issue move "$ISSUE" "In Progress"
jira issue assign "$ISSUE" $(jira me)

# Add work log
jira issue worklog add "$ISSUE" --time "2h" --comment "Implemented feature"

# Add comment
jira issue comment add "$ISSUE" "Fixed the bug"

# Complete issue
jira issue move "$ISSUE" Done
```

### Daily Workflow with jq

```bash
# View my active sprint issues with key info using jq
SPRINT_ID=$(jira sprint list --state active --raw | jq -r '.values[0].id')
jira sprint list "$SPRINT_ID" --raw | jq -r '.issues[] | "\(.key): \(.fields.summary) [\(.fields.status.name)]"'

# Get my issues in current sprint
jira sprint list "$SPRINT_ID" --raw | jq --arg me "$(jira me --raw | jq -r '.name')" -r '.issues[] | select(.fields.assignee.name == $me) | "\(.key): \(.fields.summary)"'
```

### Integration with Git

```bash
# Create branch from issue key and summary
ISSUE="PROJ-123"
SUMMARY=$(jira issue view "$ISSUE" --plain | head -1 | sed 's/.*Summary: //')
BRANCH_NAME=$(echo "$ISSUE-$SUMMARY" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | head -c 60)
git checkout -b "$BRANCH_NAME"

# Using jq for cleaner extraction
ISSUE="PROJ-123"
BRANCH_NAME=$(jira issue view "$ISSUE" --raw | jq -r '.fields.summary' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | head -c 50)
git checkout -b "$ISSUE-$BRANCH_NAME"

# Add issue to commit message
git commit -m "$ISSUE: Implement feature"

# Transition issue when pushing
git push && jira issue move "$ISSUE" "Code Review"
```

### Bulk Operations

```bash
# Assign multiple issues
for issue in PROJ-123 PROJ-124 PROJ-125; do
  jira issue assign "$issue" $(jira me)
done

# Add multiple issues to sprint
jira sprint add 42 PROJ-123 PROJ-124 PROJ-125

# Move multiple issues to same state
for issue in PROJ-123 PROJ-124; do
  jira issue move "$issue" "In Progress"
done
```

### Bulk Operations with jq

```bash
# Get all "To Do" issues and assign them
jira issue list --status "To Do" --raw | jq -r '.issues[].key' | while read issue; do
  jira issue assign "$issue" $(jira me)
done

# Move all "Code Review" issues in sprint to Done
SPRINT_ID=42
jira sprint list "$SPRINT_ID" --raw | jq -r '.issues[] | select(.fields.status.name == "Code Review") | .key' | while read issue; do
  jira issue move "$issue" Done
done

# Add all unassigned bugs to yourself
jira issue list --type Bug --raw | jq -r '.issues[] | select(.fields.assignee == null) | .key' | while read issue; do
  jira issue assign "$issue" $(jira me)
done
```

### Export & Reporting

```bash
# Export filtered issues to CSV
jira issue list --status "Done" --created-after -30d --csv > completed-last-30-days.csv

# Export sprint issues
SPRINT_ID=42
jira sprint list "$SPRINT_ID" --csv > sprint-42-issues.csv

# Complex query with jq transformation to CSV
jira issue list --raw | jq -r '.issues[] | [.key, .fields.status.name, .fields.assignee.displayName // "Unassigned", .fields.summary] | @csv' > issues.csv

# Generate report with counts
echo "Issue Status Report"
echo "==================="
jira issue list --raw | jq -r '.issues | group_by(.fields.status.name) | map("\(.| .[0].fields.status.name): \(. | length)") | .[]'

# Issues by assignee report
jira issue list --raw | jq -r '.issues | group_by(.fields.assignee.displayName) | map("\(.| .[0].fields.assignee.displayName // "Unassigned"): \(. | length)") | .[]'
```

### Check Issue Exists

```bash
# Safely check if issue exists
if jira issue view PROJ-123 --raw >/dev/null 2>&1; then
  echo "Issue exists"
else
  echo "Issue not found"
fi

# Get issue status if exists
STATUS=$(jira issue view PROJ-123 --raw 2>/dev/null | jq -r '.fields.status.name')
if [ -n "$STATUS" ]; then
  echo "Issue status: $STATUS"
fi
```

### Create Issue from Template

```bash
# Create bug with standard fields
create_bug() {
  local title="$1"
  local description="$2"
  jira issue create \
    --type Bug \
    --summary "$title" \
    --body "$description" \
    --priority High \
    --label bug \
    --assignee $(jira me)
}

create_bug "Button not working" "Steps to reproduce: ..."

# Create story with template
create_story() {
  local title="$1"
  jira issue create \
    --type Story \
    --summary "$title" \
    --body "$(cat <<'EOF'
## User Story
As a [type of user], I want [goal] so that [benefit].

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2
- [ ] Criteria 3
EOF
)" \
    --assignee $(jira me)
}

create_story "Add user authentication"
```

### Search & Filter Examples

```bash
# Find issues with specific text in summary
jira issue list "authentication"
jira issue list "bug in checkout"

# My high priority issues
jira issue list -a$(jira me) -yHigh -s~Done

# Bugs assigned to me in progress
jira issue list -tBug -a$(jira me) -s"In Progress"

# Issues created this week without assignee
jira issue list --created week -ax

# Recently updated issues I'm watching
jira issue list --watching --updated-after -3d
```

## Configuration

### View Configuration

```bash
# Show current user
jira me

# Show raw user details
jira me --raw

# View server info
jira serverinfo
jira serverinfo --raw
```

### Config File Location

```bash
# Default config location
cat ~/.config/.jira/.config.yml

# Use specific config
jira --config /path/to/.config.yml issue list

# Set via environment variable
export JIRA_CONFIG_FILE=/path/to/.config.yml
jira issue list
```

## Pagination & Performance

```bash
# Limit results (default is 0:100)
jira issue list --paginate 20  # First 20
jira issue list --paginate 10:50  # 50 items starting from 10

# Useful for large result sets
jira issue list --jql "project = BIGPROJ" --paginate 0:25
```
