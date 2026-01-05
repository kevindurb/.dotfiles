---
name: building-skills
description: Creates new Claude Code skills by generating proper directory structure, SKILL.md files with YAML frontmatter, and supporting documentation. Use when user wants to create, scaffold, or build a new skill.
---

# Building Skills

Creates new Claude Code skills with proper structure and best practices.

## Quick Reference

- **Best Practices**: @best-practices.md (start here!)
- **Full Documentation**: @reference.md
- **Examples**: @examples.md
- **Templates**: @template.md

## Workflow

1. **Gather Requirements**
   - What does the skill do?
   - When should it be invoked? (for description)
   - Name using gerund form: `verb-ing-noun` (e.g., `processing-pdfs`)
   - Personal (`~/.claude/skills/`) or project (`.claude/skills/`)?
   - What tools are needed?

2. **Create Structure**
   ```bash
   mkdir -p ~/.claude/skills/processing-pdfs  # or .claude/skills/
   ```

3. **Generate SKILL.md**
   - YAML frontmatter: `name` and `description` (required)
   - Clear, concise instructions
   - Reference supporting files with @filename.md

4. **Add Supporting Files** (optional)
   - Templates, reference docs, scripts

5. **Test**
   - Ask "What skills are available?"
   - Test with trigger phrases

## SKILL.md Format

```yaml
---
name: processing-pdfs
description: Processes PDF files when user wants to extract, convert, or analyze PDF documents
---

# Processing PDFs

Instructions here. Reference @other-files.md as needed.
```

## Key Best Practices

- **Name**: Use gerund form (verb + -ing): `processing-pdfs`, `generating-components`
- **Description**: Third person, focus on WHEN to use (triggers auto-invocation)
- **Instructions**: Clear, actionable, with examples
- **Be concise**: Challenge each line - does Claude really need this?
- **Reference external docs**: Use @filename.md for detailed info

See @best-practices.md for complete guidelines.
