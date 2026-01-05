# Reviewing PRs Skill

A Claude Code skill for reading and responding to GitHub pull request reviews and comments.

## Structure

- **SKILL.md** - Main skill instructions with workflow
- **commands.md** - Complete `gh` CLI command reference
- **examples.md** - Real-world usage examples with tested output

## What It Does

- Fetches PR reviews (overall approval/changes requested)
- Gets review comments (inline code comments with diff context)
- Retrieves issue comments (general PR discussion)
- Helps format and present feedback clearly
- Assists with drafting responses and making changes

## Tested Against

All commands tested against `cli/cli` repository PR #12158 on 2025-11-18.

## Trigger

The skill will be invoked when users ask to:
- "Read the reviews on PR #123"
- "Show me the feedback on this pull request"
- "What comments did reviewers leave?"
- "Help me respond to PR reviews"

## Key Commands

```bash
# Quick overview
gh pr view <number> --json reviews,comments,latestReviews

# Detailed reviews
gh api repos/{owner}/{repo}/pulls/{pr}/reviews

# Inline comments
gh api repos/{owner}/{repo}/pulls/{pr}/comments

# General discussion
gh api repos/{owner}/{repo}/issues/{pr}/comments
```

See commands.md and examples.md for complete reference.
