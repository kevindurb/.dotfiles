# Claude Code Skills Reference

Complete documentation for creating and managing Claude Code skills.

## What are Skills?

Agent Skills are modular capabilities that extend Claude's functionality:
- Packaged as directories containing a `SKILL.md` file
- Automatically invoked by Claude based on context (not slash commands)
- Can include instructions, scripts, templates, and reference docs
- Discovered automatically from multiple sources

## Skill Types

### Personal Skills (Global)
- **Location**: `~/.claude/skills/skill-name/`
- **Scope**: Available in all your projects
- **Use for**: Personal workflows, individual productivity
- **Sharing**: Private to your machine

### Project Skills
- **Location**: `.claude/skills/skill-name/`
- **Scope**: Current project only
- **Use for**: Team workflows, project-specific features
- **Sharing**: Committed to git, shared with team

### Plugin Skills
- **Location**: Bundled with installed plugins
- **Scope**: Available when plugin is installed
- **Use for**: Plugin-specific functionality
- **Sharing**: Distributed with plugin

## Directory Structure

```
skill-name/
├── SKILL.md              # Required: Main instructions with YAML frontmatter
├── reference.md          # Optional: Detailed documentation
├── examples.md           # Optional: Usage examples
├── templates/            # Optional: File templates
│   ├── template-1.ext
│   └── template-2.ext
└── scripts/              # Optional: Helper scripts
    └── helper.sh
```

## SKILL.md Format

### Required YAML Frontmatter

```yaml
---
name: skill-name
description: Clear description of when Claude should use this skill
---
```

**Field Requirements:**
- `name`: Required, lowercase with hyphens, max 64 characters
- `description`: Required, max 1024 characters, focus on WHEN to use

### Optional YAML Frontmatter

```yaml
---
name: skill-name
description: When to use this skill
allowed-tools: [Read, Write, Bash, Edit]  # Restrict tool access
version: "1.0.0"                          # Version tracking
changelog:
  - "1.0.0: Initial release"
  - "1.1.0: Added feature X"
---
```

### Content Structure (Markdown)

After frontmatter, include:

1. **Title** - Main heading describing the skill
2. **What it does** - Brief overview
3. **When to use** - Specific trigger scenarios
4. **Instructions** - Clear, numbered steps
5. **Examples** - Code blocks and sample usage
6. **References** - Links to supporting files (@filename.md)
7. **Edge cases** - Limitations and special considerations

## Best Practices

### Naming Conventions

**Skill Names:**
- Use lowercase with hyphens: `my-skill-name`
- Be descriptive and specific
- Max 64 characters
- Examples: `api-generator`, `test-runner`, `doc-writer`

**File Names:**
- Use lowercase with hyphens or underscores
- Be descriptive: `api-template.ts`, `reference-docs.md`
- Use appropriate extensions

### Writing Descriptions

The description is critical for auto-invocation. Focus on:

**Good Descriptions:**
- "Generates React components with TypeScript and tests when user requests a new component"
- "Runs pytest with coverage and formats results when user wants to test Python code"
- "Creates API endpoints following REST conventions when user needs a new route"

**Poor Descriptions:**
- "Helps with components" (too vague)
- "A React skill" (doesn't explain when to use)
- "Component generator" (missing context triggers)

**Tips:**
- Include trigger keywords users might say
- Specify the context or scenario
- Mention the expected input/output
- Be specific about the domain (React, Python, API, etc.)

### Writing Instructions

**Be Clear and Actionable:**
```markdown
1. Ask user for component name
2. Read @template.tsx
3. Replace {{NAME}} with provided name
4. Create file in src/components/
5. Create test file in src/components/__tests__/
```

**Include Examples:**
```markdown
Example:
- Input: "Create a Button component"
- Output: Creates src/components/Button.tsx and test file
```

**Reference Supporting Files:**
```markdown
See @reference.md for API documentation
Use @template.ts as the base template
Check @examples.md for usage patterns
```

### Tool Access Control

Use `allowed-tools` to restrict what the skill can do:

```yaml
# Read-only skill
allowed-tools: [Read, Grep, Glob]

# File manipulation
allowed-tools: [Read, Write, Edit]

# Full access with bash
allowed-tools: [Read, Write, Edit, Bash]
```

### Keeping Skills Focused

**Do:**
- One skill, one capability
- Specific, well-defined purpose
- Clear scope and boundaries

**Don't:**
- Combine multiple unrelated features
- Create overly broad skills
- Duplicate existing functionality

### Supporting Files

**When to Use:**
- Templates for generated code
- Reference documentation too long for SKILL.md
- Example configurations
- Helper scripts
- Test fixtures

**How to Reference:**
```markdown
See @reference.md for complete API docs
Use @template.tsx as the starting point
Check @examples/ directory for samples
```

## Skill Discovery

Claude automatically discovers skills from:
1. Personal skills directory (`~/.claude/skills/`)
2. Project skills directory (`.claude/skills/`)
3. Installed plugin skills

**Listing Skills:**
Ask: "What skills are available?"

**Testing Discovery:**
Use trigger phrases from your description to verify auto-invocation

## Version Management

Track changes in frontmatter:

```yaml
---
name: my-skill
description: Does something useful
version: "1.2.0"
changelog:
  - "1.2.0: Added support for TypeScript"
  - "1.1.0: Improved error handling"
  - "1.0.0: Initial release"
---
```

## Testing Skills

### 1. Verify Discovery
```
User: "What skills are available?"
Expected: Your skill appears in the list
```

### 2. Test Auto-Invocation
Use trigger phrases from your description:
```
User: "Create a new API endpoint"
Expected: api-generator skill is invoked
```

### 3. Verify Tool Access
If using `allowed-tools`, ensure only permitted tools are used

### 4. Test with Team
Share project skills via git and gather feedback

## Troubleshooting

### Skill Not Discovered

**Symptoms:**
- Skill doesn't appear in "What skills are available?"
- Never gets invoked

**Solutions:**
- Check YAML frontmatter syntax (use YAML validator)
- Verify file is named exactly `SKILL.md` (case-sensitive)
- Ensure directory is in correct location
- Restart Claude Code session

### Wrong Invocation Context

**Symptoms:**
- Skill invoked at wrong times
- Never invoked when it should be

**Solutions:**
- Make description more specific
- Add trigger keywords to description
- Narrow the scope (avoid "helps with...")
- Test with various phrasings

### Tool Access Issues

**Symptoms:**
- Permission denied
- Can't execute needed operations

**Solutions:**
- Add `allowed-tools` to frontmatter
- List all required tools explicitly
- Check tool names are correct (case-sensitive)

### Supporting Files Not Found

**Symptoms:**
- @filename.md not found
- Templates can't be read

**Solutions:**
- Verify file is in same directory as SKILL.md
- Check filename matches exactly (case-sensitive)
- Use relative paths from skill directory

## Advanced Patterns

### Multi-Step Workflows

```markdown
---
name: full-feature
description: Implements complete feature with code, tests, and docs
---

# Full Feature Builder

1. Gather requirements (see @requirements-template.md)
2. Generate code (use @code-template.ts)
3. Generate tests (use @test-template.ts)
4. Update documentation (see @doc-guidelines.md)
5. Run validation checks
```

### Conditional Logic

```markdown
# Smart Component Generator

1. Ask: "React or Vue component?"
2. If React:
   - Use @react-template.tsx
   - Create in src/components/
3. If Vue:
   - Use @vue-template.vue
   - Create in src/views/
```

### Integration with Other Tools

```markdown
# Deploy Skill

1. Run tests: `npm test`
2. Build: `npm run build`
3. Use @deploy-checklist.md
4. Execute: `bash scripts/deploy.sh`
```

## Common Use Cases

### Code Generators
- Component generators
- API endpoint scaffolding
- Test file creation
- Configuration files

### Testing & QA
- Test runners with formatting
- Coverage reports
- Lint and format workflows
- Pre-commit checks

### Documentation
- README generators
- API documentation
- Changelog maintenance
- Code comments

### Project Management
- Issue templates
- PR descriptions
- Project setup
- Dependency management

### DevOps
- Deployment workflows
- Environment setup
- CI/CD integration
- Log analysis

## Resources

- **Official Docs**: https://code.claude.com/docs/en/skills
- **Skill Directory**: `~/.claude/skills/` (personal) or `.claude/skills/` (project)
- **Discovery**: Ask "What skills are available?"
