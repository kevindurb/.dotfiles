# Skill Template

Copy and customize this template when creating new skills.

## Basic Template

```markdown
---
name: skill-name
description: Clear description of when to use this skill (focus on trigger conditions)
---

# Skill Title

Brief overview of what this skill does.

## When to Use

- Scenario 1
- Scenario 2
- Scenario 3

## Steps

1. First action
2. Second action
3. Third action

## Examples

Example usage here.

## Notes

Any limitations or special considerations.
```

## Template with Tool Restrictions

```markdown
---
name: skill-name
description: Description here
allowed-tools: [Read, Write, Bash]
---

# Skill Title

Content here.
```

## Template with Version Info

```markdown
---
name: skill-name
description: Description here
version: "1.0.0"
changelog:
  - "1.0.0: Initial release"
---

# Skill Title

Content here.
```

## Template with Supporting Files

```markdown
---
name: skill-name
description: Description here
---

# Skill Title

Overview.

## Reference

- See @reference.md for detailed documentation
- Use @template.ext as the base template
- Check @examples.md for usage patterns

## Steps

1. Read @template.ext
2. Modify as needed
3. Save result
```

## Generator Template

```markdown
---
name: file-generator
description: Generates files from templates when user requests specific file types
allowed-tools: [Read, Write]
---

# File Generator

Generates files from templates.

## Steps

1. Ask user for:
   - File name
   - Required parameters

2. Read @template.ext

3. Replace placeholders:
   - {{PLACEHOLDER_1}} with value 1
   - {{PLACEHOLDER_2}} with value 2

4. Create file in appropriate directory

5. Report file path

## Template

See @template.ext
```

## Workflow Template

```markdown
---
name: workflow-skill
description: Manages multi-step workflow when user wants to perform complex task
allowed-tools: [Read, Write, Edit, Bash]
version: "1.0.0"
---

# Workflow Skill

Manages a multi-step process.

## Overview

High-level description of the workflow.

## Prerequisites

- Requirement 1
- Requirement 2

## Workflow

### Stage 1: Preparation
1. Check preconditions
2. Gather requirements
3. Validate input

### Stage 2: Execution
1. Main task step 1
2. Main task step 2
3. Main task step 3

### Stage 3: Validation
1. Verify results
2. Run tests
3. Check output

### Stage 4: Cleanup
1. Remove temporary files
2. Update documentation
3. Report completion

## Error Handling

- If X fails: do Y
- If Z is missing: do W

## Resources

- @reference.md - Additional documentation
- @config.json - Configuration options
```

## Analysis Template

```markdown
---
name: analyzer-skill
description: Analyzes code/files when user wants to check or review something
allowed-tools: [Read, Grep, Glob]
---

# Analyzer Skill

Analyzes files and reports findings.

## Steps

1. **Identify Scope**
   - Ask user which files/directory
   - Confirm analysis type

2. **Gather Data**
   - Use Glob to find files: `**/*.ext`
   - Read relevant files
   - Use Grep for patterns

3. **Analyze**
   - Check for pattern A
   - Check for pattern B
   - Calculate metrics

4. **Report Findings**
   - Summary statistics
   - Issues found with file:line
   - Recommendations

## Patterns to Check

- Pattern 1: `regex1`
- Pattern 2: `regex2`
- Pattern 3: `regex3`

## Output Format

```
Analysis Results
================
Files checked: X
Issues found: Y

Details:
- file.ext:123: Issue description
- file.ext:456: Issue description

Recommendations:
1. Fix A
2. Improve B
```
```

## Test Runner Template

```markdown
---
name: test-runner-skill
description: Runs tests and reports results when user wants to test code
allowed-tools: [Bash, Read]
---

# Test Runner Skill

Executes tests and formats results.

## Steps

1. **Detect Test Framework**
   - Check package.json/requirements.txt/go.mod
   - Identify: jest/pytest/go test/etc

2. **Run Tests**
   ```bash
   # Framework-specific command
   npm test -- --coverage
   ```

3. **Parse Output**
   - Extract pass/fail counts
   - Identify failed tests
   - Note coverage metrics

4. **Format Report**
   - Summary table
   - Failed test details
   - Coverage breakdown

5. **Suggest Actions**
   - Fix failing tests
   - Improve coverage
   - Update snapshots

## Output Format

```
Test Results
============
✓ Passed: X
✗ Failed: Y
Total: Z

Coverage:
- Statements: X%
- Branches: Y%
- Functions: Z%

Failed Tests:
- test name (file.test.ts:123)
```
```

## Documentation Template

```markdown
---
name: doc-generator
description: Generates documentation when user needs to document code or features
allowed-tools: [Read, Write, Glob]
---

# Documentation Generator

Creates documentation from code and user input.

## Steps

1. **Analyze Codebase**
   - Find main files
   - Extract functions/classes
   - Identify public API

2. **Gather Details**
   - Ask user for:
     - Description
     - Examples
     - Special notes

3. **Generate Documentation**
   - Use @doc-template.md
   - Fill in sections:
     - Overview
     - API reference
     - Examples
     - Configuration

4. **Format Output**
   - Proper markdown
   - Code blocks with syntax
   - Table of contents

## Template

See @doc-template.md for structure
```

## Configuration Template

```markdown
---
name: config-manager
description: Manages configuration files when user needs to set up or update config
allowed-tools: [Read, Write, Edit]
---

# Configuration Manager

Manages project configuration files.

## Steps

1. **Identify Config Type**
   - .env files
   - JSON config
   - YAML config
   - INI files

2. **Check Existing**
   - Read current config
   - Note missing values

3. **Gather Values**
   - Ask user for:
     - Setting 1
     - Setting 2
     - Setting 3

4. **Update Config**
   - Merge with existing
   - Validate format
   - Add comments

5. **Verify**
   - Check syntax
   - Ensure required values present
   - Create .example version

## Config Formats

See @config-examples/ for format samples
```

## Placeholder Reference

Common placeholders to use in templates:

```
{{NAME}}                - Main name/identifier
{{DESCRIPTION}}         - Description text
{{DATE}}                - Current date
{{AUTHOR}}              - Author name
{{VERSION}}             - Version number
{{PATH}}                - File path
{{FILENAME}}            - File name
{{EXTENSION}}           - File extension
{{CONTENT}}             - Main content
{{IMPORTS}}             - Import statements
{{EXPORTS}}             - Export statements
{{PARAMETERS}}          - Function parameters
{{RETURN_TYPE}}         - Return type
{{PROPS}}               - Component props
{{STATE}}               - State variables
{{METHODS}}             - Class methods
```

## Naming Conventions

**Skill Names:**
- `api-generator` - Generates APIs
- `test-runner` - Runs tests
- `doc-writer` - Writes documentation
- `config-manager` - Manages configuration
- `code-analyzer` - Analyzes code

**File Names:**
- `reference.md` - Reference documentation
- `examples.md` - Usage examples
- `template.ext` - File template
- `config.json` - Configuration file
- `helper-script.sh` - Helper script

## File Structure Examples

### Simple Skill
```
my-skill/
└── SKILL.md
```

### Skill with Reference
```
my-skill/
├── SKILL.md
└── reference.md
```

### Skill with Templates
```
my-skill/
├── SKILL.md
├── reference.md
├── examples.md
└── templates/
    ├── file-template.ext
    └── another-template.ext
```

### Complex Skill
```
my-skill/
├── SKILL.md
├── reference.md
├── examples.md
├── templates/
│   ├── template-1.ext
│   └── template-2.ext
└── scripts/
    ├── helper.sh
    └── validator.js
```
