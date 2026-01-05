# Skill Examples

Real-world examples of Claude Code skills with varying complexity.

## Minimal Skill

**Use case**: Simple greeting skill

```markdown
---
name: hello-world
description: Greets the user with a friendly message when they say hello
---

# Hello World Skill

When user greets you, respond with: "Hello from the skill system! 👋"
```

## Read-Only Analysis Skill

**Use case**: Code quality checker

```markdown
---
name: code-quality
description: Analyzes code quality and suggests improvements when user asks to review or check code quality
allowed-tools: [Read, Grep, Glob]
---

# Code Quality Checker

Analyzes code for common issues and best practices.

## Steps

1. Ask user which files or directory to analyze
2. Use Glob to find all code files
3. Use Grep to check for:
   - TODO comments
   - console.log statements
   - Hardcoded credentials patterns
4. Report findings with file:line references
5. Suggest improvements

## Patterns to Check

- `TODO|FIXME|HACK`
- `console\.log`
- `password\s*=\s*["']`
- Large function sizes (>50 lines)
```

## Template-Based Generator

**Use case**: React component generator

```markdown
---
name: react-component
description: Generates React TypeScript components with tests when user requests a new React component
allowed-tools: [Read, Write]
version: "1.0.0"
---

# React Component Generator

Creates React components following project conventions.

## Steps

1. Ask user for:
   - Component name (PascalCase)
   - Component type (functional/class)
   - Include tests? (yes/no)

2. Read @component-template.tsx

3. Replace placeholders:
   - `{{COMPONENT_NAME}}` with provided name
   - `{{COMPONENT_TYPE}}` with type

4. Create file: `src/components/{{COMPONENT_NAME}}.tsx`

5. If tests requested:
   - Read @test-template.tsx
   - Replace placeholders
   - Create: `src/components/__tests__/{{COMPONENT_NAME}}.test.tsx`

6. Report created files with paths

## Templates

See @component-template.tsx and @test-template.tsx
```

Supporting file: `component-template.tsx`
```typescript
import React from 'react';

interface {{COMPONENT_NAME}}Props {
  // Add props here
}

export const {{COMPONENT_NAME}}: React.FC<{{COMPONENT_NAME}}Props> = (props) => {
  return (
    <div className="{{COMPONENT_NAME}}">
      {/* Component content */}
    </div>
  );
};
```

## Multi-File Workflow Skill

**Use case**: API endpoint creator

```markdown
---
name: api-endpoint
description: Creates REST API endpoints with routes, controllers, tests, and documentation when user needs a new API endpoint
allowed-tools: [Read, Write, Edit, Bash]
version: "1.0.0"
---

# API Endpoint Generator

Creates complete API endpoints following REST conventions.

## Workflow

1. **Gather Requirements**
   - Endpoint path (e.g., `/api/users`)
   - HTTP method (GET, POST, PUT, DELETE)
   - Request/response schemas
   - Authentication required?

2. **Generate Route**
   - Read @route-template.ts
   - Create file in `src/routes/`
   - Use RESTful naming

3. **Generate Controller**
   - Read @controller-template.ts
   - Create file in `src/controllers/`
   - Include error handling

4. **Generate Tests**
   - Read @api-test-template.ts
   - Create file in `src/tests/api/`
   - Include success and error cases

5. **Update Documentation**
   - Edit `docs/api.md`
   - Add endpoint documentation
   - Include examples

6. **Run Tests**
   - Execute: `npm test -- --grep "{{endpoint}}"`
   - Report results

## Templates

- @route-template.ts - Express route boilerplate
- @controller-template.ts - Controller with error handling
- @api-test-template.ts - Jest/Supertest template
- @docs-template.md - API documentation format

## Validation

Ensure:
- Route follows naming convention
- All CRUD operations consistent
- Tests cover edge cases
- Documentation is complete
```

## Bash Script Integration

**Use case**: Git workflow helper

```markdown
---
name: git-workflow
description: Guides through git branching and PR workflow when user wants to create a feature branch or submit a PR
allowed-tools: [Bash, Read, Write]
---

# Git Workflow Helper

Automates common git workflows.

## Feature Branch Flow

1. Check current status: `git status`

2. Ensure clean working tree or offer to stash

3. Update main:
   ```bash
   git checkout main
   git pull origin main
   ```

4. Create feature branch:
   ```bash
   git checkout -b feature/{{branch-name}}
   ```

5. Guide user through development

6. Before commit:
   - Run linter
   - Run tests
   - Review changes

7. Commit with conventional format:
   ```bash
   git commit -m "feat: {{description}}"
   ```

8. Push and create PR:
   ```bash
   git push -u origin feature/{{branch-name}}
   gh pr create --fill
   ```

## Commit Conventions

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `refactor:` - Code refactoring
- `test:` - Test changes
```

## Documentation Generator

**Use case**: README creator

```markdown
---
name: readme-generator
description: Generates comprehensive README.md files when user needs project documentation
allowed-tools: [Read, Write, Bash, Glob]
---

# README Generator

Creates well-structured README.md files.

## Steps

1. **Analyze Project**
   - Use Glob to find package.json/setup.py/go.mod
   - Detect project type and language
   - Find main entry points

2. **Gather Information**
   - Ask user:
     - Project description
     - Key features
     - Installation requirements
     - Usage examples

3. **Generate Sections**
   - Use @readme-template.md
   - Fill in:
     - Title and badges
     - Description
     - Installation
     - Usage
     - API documentation
     - Contributing
     - License

4. **Extract Code Examples**
   - Find example files
   - Include relevant snippets

5. **Add Scripts**
   - Parse package.json scripts
   - Document each script

6. **Create File**
   - Write to README.md
   - Format with proper markdown

## Template

See @readme-template.md for structure
```

Supporting file: `readme-template.md`
```markdown
# {{PROJECT_NAME}}

{{BADGES}}

## Description

{{DESCRIPTION}}

## Features

{{FEATURES}}

## Installation

{{INSTALLATION}}

## Usage

{{USAGE}}

## API

{{API_DOCS}}

## Contributing

{{CONTRIBUTING}}

## License

{{LICENSE}}
```

## Testing & QA Skill

**Use case**: Test runner with formatting

```markdown
---
name: test-runner
description: Runs tests with coverage and formats results when user wants to run tests or check test coverage
allowed-tools: [Bash, Read, Write]
---

# Test Runner

Executes tests and formats results for easy reading.

## Workflow

1. **Detect Test Framework**
   - Check package.json for jest/mocha/pytest/go test
   - Adapt commands accordingly

2. **Run Tests**
   ```bash
   npm test -- --coverage --verbose
   ```

3. **Parse Output**
   - Extract pass/fail counts
   - Identify failed tests
   - Note coverage percentages

4. **Format Results**
   - Summary table:
     ```
     Tests:    15 passed, 2 failed, 17 total
     Coverage: 87.5% statements
               82.3% branches
     ```
   - Failed tests with file:line
   - Coverage gaps

5. **Suggest Next Steps**
   - Fix failing tests
   - Improve coverage in specific areas
   - Update snapshots if needed

## Coverage Thresholds

- Statements: 80%
- Branches: 75%
- Functions: 80%
- Lines: 80%
```

## Configuration Management

**Use case**: Environment setup

```markdown
---
name: env-setup
description: Creates and manages environment configuration files when user needs to set up environment variables
allowed-tools: [Read, Write]
---

# Environment Setup

Manages .env files and environment configuration.

## Steps

1. **Check Existing Config**
   - Look for .env.example
   - Check .gitignore for .env

2. **Ask for Variables**
   - Database credentials
   - API keys
   - Service URLs
   - Feature flags

3. **Create .env File**
   - Use @env-template.env
   - Fill in provided values
   - Use placeholder for secrets

4. **Update .env.example**
   - Public template without secrets
   - Include comments for each var

5. **Verify .gitignore**
   - Ensure .env is ignored
   - Add if missing

6. **Document Variables**
   - Create or update README section
   - Explain each variable

## Security

- Never commit .env files
- Use placeholders in examples
- Rotate secrets regularly
- Use secret management in production
```

## Refactoring Assistant

**Use case**: Code refactoring helper

```markdown
---
name: refactor-assistant
description: Helps refactor code by identifying patterns and suggesting improvements when user wants to refactor or improve code structure
allowed-tools: [Read, Edit, Grep, Bash]
---

# Refactor Assistant

Guides through code refactoring with safety checks.

## Process

1. **Analyze Code**
   - Read target file(s)
   - Identify code smells:
     - Long functions (>50 lines)
     - Repeated code
     - Deep nesting (>3 levels)
     - Magic numbers

2. **Propose Changes**
   - Show before/after snippets
   - Explain improvements
   - Get user approval

3. **Safety Checks**
   - Run tests before changes
   - Ensure tests exist
   - Check git status (offer to commit first)

4. **Apply Refactoring**
   - Make changes incrementally
   - Run tests after each change
   - Rollback if tests fail

5. **Verify**
   - Run full test suite
   - Check linter
   - Review diff

## Refactoring Patterns

See @refactoring-patterns.md for:
- Extract function
- Extract variable
- Replace magic numbers
- Reduce nesting
- DRY principle
```

## Common Patterns

### Ask-Then-Generate
```markdown
1. Ask user for requirements
2. Validate input
3. Generate from template
4. Verify output
```

### Read-Process-Write
```markdown
1. Read existing file(s)
2. Process/transform content
3. Write to new or updated file
4. Confirm with user
```

### Validate-Execute-Report
```markdown
1. Validate preconditions
2. Execute action
3. Verify result
4. Report status
```

### Multi-Stage Pipeline
```markdown
1. Stage 1: Preparation
2. Stage 2: Execution
3. Stage 3: Validation
4. Stage 4: Cleanup
```
