# Best Practices for Creating Skills

Official best practices from the Claude Code documentation.

## Core Principle

> "Default assumption: Claude is already very smart. Only add context Claude doesn't already have."

Challenge each piece of information: **"Does Claude really need this explanation?"**

## 1. Be Concise

### Keep It Short
- **Target**: Keep SKILL.md under 500 lines
- Aim for clarity over completeness
- Use progressive disclosure (link to detailed files)

### What to Include
✅ **DO include:**
- Context Claude doesn't already know
- Project-specific conventions
- Non-obvious workflows
- Critical edge cases

❌ **DON'T include:**
- Explanations of basic programming concepts
- Common tool usage (Claude knows bash, git, etc.)
- Obvious steps
- General best practices Claude already knows

### Progressive Disclosure
Instead of putting everything in SKILL.md:
```markdown
# Good: Concise with references
See @detailed-api-docs.md for complete API reference
Use @template.tsx as starting point
Check @edge-cases.md for known issues
```

```markdown
# Bad: Everything in one file
The API has endpoints for users, posts, comments...
[50 lines of API documentation]
[30 lines of examples]
[20 lines of edge cases]
```

## 2. Naming Conventions

### Skill Names: Use Gerund Form (verb + -ing)

✅ **Good examples:**
- `processing-pdfs`
- `analyzing-spreadsheets`
- `generating-components`
- `running-tests`
- `managing-configs`

❌ **Bad examples:**
- `pdf-processor` (noun form)
- `helper` (too vague)
- `utils` (too generic)
- `my-skill` (not descriptive)
- `tool` (doesn't describe action)

### Why Gerunds?
- Describes the action being performed
- Natural language fit: "when processing PDFs..."
- Clear what the skill actively does

## 3. Degrees of Freedom

Match instruction specificity to task complexity.

### High Freedom (Flexible Tasks)
Use for creative or adaptive tasks:
```markdown
Analyze the codebase structure and suggest improvements.
Consider maintainability, performance, and readability.
```

### Low Freedom (Critical Operations)
Use for fragile or critical tasks:
```markdown
1. Verify git status is clean
2. Run: git checkout main
3. Run: git pull origin main
4. Create branch: git checkout -b feature/{{name}}
5. Confirm branch created successfully
```

### Finding the Balance
- **Too strict**: Brittle, breaks on edge cases
- **Too loose**: Inconsistent results
- **Just right**: Clear intent with adaptive execution

## 4. Writing Descriptions

### Use Third Person
✅ **Good:**
```yaml
description: Generates React components with TypeScript when the user requests a new component
```

❌ **Bad:**
```yaml
description: I will generate React components for you
```

### Be Specific with Key Terms
Include trigger words users might say:
```yaml
# Good: Specific with keywords
description: Analyzes Python code for PEP 8 compliance when user wants to check code style or lint Python files

# Bad: Too vague
description: Checks code quality
```

### Include Context
```yaml
# Good: Clear when to use
description: Runs pytest with coverage reporting when user wants to test Python code or check test coverage

# Bad: Missing context
description: Test runner
```

## 5. Anti-Patterns to Avoid

### ❌ Time-Sensitive Information
```markdown
# Bad: Will become outdated
As of 2024, use Node.js 20 LTS
The latest version of React is 18.2
```

```markdown
# Good: Timeless
Check package.json for Node.js version requirements
Use the React version specified in package.json
```

### ❌ Inconsistent Terminology
```markdown
# Bad: Multiple terms for same thing
1. Create the component file
2. Generate the interface definition
3. Make the test file
```

```markdown
# Good: Consistent
1. Create the component file
2. Create the interface file
3. Create the test file
```

### ❌ Windows-Style File Paths
```markdown
# Bad: Platform-specific
Create file at: src\components\Button.tsx
```

```markdown
# Good: Cross-platform
Create file at: src/components/Button.tsx
```

### ❌ Assuming Tools Are Installed
```markdown
# Bad: Assumes installation
Run: docker-compose up
```

```markdown
# Good: Checks first
1. Check if docker-compose is available
2. If not found, suggest: npm install -g docker-compose
3. Then run: docker-compose up
```

### ❌ Overly Complex References
```markdown
# Bad: Nested references
See @reference.md section 3.2.1 for details on
the configuration format described in @config-guide.md
which references @advanced-options.md
```

```markdown
# Good: Simple references
See @configuration.md for all config options
```

## 6. Workflow Best Practices

### Use Clear Sequential Steps
```markdown
## Steps

1. **Gather Requirements**
   - Ask for component name
   - Ask for component type

2. **Validate Input**
   - Ensure name is PascalCase
   - Verify type is valid

3. **Generate Files**
   - Create component file
   - Create test file

4. **Verify**
   - Confirm files created
   - Report paths to user
```

### Implement Feedback Loops
```markdown
1. Generate code from template
2. Show code to user for approval
3. If approved, write to file
4. If changes needed, regenerate
```

### Handle Errors Gracefully
```markdown
## Error Handling

If file already exists:
- Ask user: overwrite, rename, or cancel?

If tests fail:
- Show failure details
- Offer to rollback changes
- Suggest fixes
```

## 7. Testing & Validation

### Test Discovery
```
Ask: "What skills are available?"
Verify: Your skill appears in list
```

### Test Invocation
Use trigger phrases from description:
```
User: "I need to process a PDF"
Expected: processing-pdfs skill activates
```

### Test Across Models
- Test with different prompt variations
- Verify consistent behavior
- Check tool access works correctly

## 8. Organization Patterns

### Simple Skill (Under 100 lines)
```
skill-name/
└── SKILL.md
```

### Standard Skill (100-300 lines content)
```
skill-name/
├── SKILL.md          # Core instructions (concise)
├── reference.md      # Detailed documentation
└── examples.md       # Usage examples
```

### Complex Skill (Multiple templates/scripts)
```
skill-name/
├── SKILL.md
├── reference.md
├── templates/
│   ├── template-1.ext
│   └── template-2.ext
└── scripts/
    └── helper.sh
```

## 9. Documentation Tips

### Use Table of Contents for Long Docs
```markdown
# Reference Documentation

## Table of Contents
- [Section 1](#section-1)
- [Section 2](#section-2)
- [Section 3](#section-3)
```

### Provide Examples
Always include concrete examples:
```markdown
# Good: Has example
Replace {{NAME}} with the component name

Example:
- Input: "Button"
- Output: Creates Button.tsx
```

```markdown
# Bad: No example
Replace the placeholder with the name
```

### Use Code Blocks with Syntax
```markdown
# Good: Syntax highlighting
```typescript
export const Component: React.FC = () => {
  return <div>Hello</div>;
};
```
```

```markdown
# Bad: No syntax highlighting
export const Component: React.FC = () => {
  return <div>Hello</div>;
};
```

## 10. Advanced Tips

### Create Utility Scripts for Complex Tasks
```
skill-name/
├── SKILL.md
└── scripts/
    ├── validate.sh      # Input validation
    ├── generate.js      # File generation
    └── test.sh          # Run tests
```

### Use Validation Steps for Critical Operations
```markdown
## Safety Checks

Before modifying files:
1. ✓ Git status is clean or changes are stashed
2. ✓ Tests pass on current code
3. ✓ User confirms operation
4. ✓ Backup created if needed
```

### Progressive Enhancement
Start simple, add complexity as needed:
```markdown
# Version 1.0: Basic functionality
Create component from template

# Version 1.1: Add validation
Validate component name format

# Version 1.2: Add tests
Generate test files automatically

# Version 1.3: Add styling
Include CSS module templates
```

## Quick Checklist

Before finalizing a skill:

- [ ] Name uses gerund form (verb + -ing)
- [ ] Description is specific with key terms
- [ ] Description uses third person
- [ ] SKILL.md is concise (ideally under 500 lines)
- [ ] No time-sensitive information
- [ ] Uses Unix-style paths (/)
- [ ] Doesn't assume tools are installed
- [ ] Steps are clear and sequential
- [ ] Includes examples
- [ ] References external files for details
- [ ] Tested with trigger phrases
- [ ] Handles errors gracefully
- [ ] Has appropriate degree of freedom

## Remember

**Claude is already smart.** Your skill should:
- Add project-specific context
- Provide non-obvious workflows
- Automate repetitive tasks
- Enforce team conventions

**Claude doesn't need:**
- Basic programming lessons
- Common tool explanations
- Obvious instructions
- General best practices
