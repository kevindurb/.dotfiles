---
name: using-jira
description: Use when working with Jira issues, epics, sprints, or workflows via the jira CLI tool
---

# Using Jira CLI

Use the `jira` CLI tool via the Bash tool for all Jira operations.

## Authentication & Setup

**IMPORTANT**: If you encounter authentication or configuration errors:

1. Check if jira CLI is installed:
   ```bash
   which jira || echo "Not installed. Visit: https://github.com/ankitpokhrel/jira-cli"
   ```

2. Check authentication status:
   ```bash
   jira me
   ```

3. If not configured, prompt user to run:
   ```bash
   jira init
   ```

4. Common config location: `~/.config/.jira/.config.yml`

## Commands & Usage

See @common-commands.md for detailed command reference, examples, and common operations.

## Best Practices

- Use `jira` commands via Bash tool for all Jira operations
- Always check `jira <command> --help` for available options
- Use interactive mode for complex operations when appropriate
- Use `--raw` flag for JSON output with jq processing
- Use `--plain` for script-friendly output
- Use `--no-truncate` to see full content in list views
