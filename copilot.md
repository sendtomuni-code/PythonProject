# Copilot Wiki Publishing Guidelines

## Publishing Instructions for Wiki Pages

When publishing content to Confluence wiki, follow these guidelines:

### Publication URL
All pages should be published to: `https://subarnamuni.atlassian.net/wiki/spaces/Python/overview?homepageId=295081`

### Workflow Steps

#### 1. Gather Resources
- **PDFs**: Locate all PDF files in the `Resouce/` folder (note: misspelled in repository)
- **Images**: Locate all PNG/image files in the `Resouce/` folder
- **Practice Code**: Gather examples from the `Pratice/` folder (note: misspelled in repository)

#### 2. Create Confluence Page
- Extract and organize content from practice notebooks/scripts
- Create comprehensive sections with code examples
- Include practical examples from the practice files
- Use tables for comparisons and rule summaries

#### 3. Important - Do NOT Include:
- ❌ Learning resources section mentioning PDF names
- ❌ PDF file names or references
- ❌ Explicit PNG file names or references

### Image Handling

#### Option A: Upload Images (Preferred)
If you have access to upload images directly:
1. When creating the page, include image placeholders in the content
2. Upload PNG files using Confluence's image upload feature
3. Embed images directly in the page

#### Option B: Reference Images (Fallback)
If unable to upload images directly:
1. Add placeholder text: `📎 Upload image <imageName>.png here`
2. Example: `📎 Upload image indexing_diagram.png here`
3. User can manually upload the images later

### Content Organization Template

```
# Topic Title

## Overview Panel
- Brief summary of what will be covered

## Main Sections
- Concepts with explanations
- Code examples with outputs
- Practical examples from practice files

## Rules/Patterns Tables
- Organized reference tables
- Comparison matrices
- Quick reference guides

## Common Patterns/Examples
- Real-world usage scenarios
- Step-by-step examples
- Edge cases

## Image References (if applicable)
- 📎 Upload image <filename>.png here
- Brief caption explaining what the image shows

## Key Takeaways
- 8-10 bullet points summarizing main concepts
```

### Content Creation Tips

1. **Use Practice Files**: Extract code examples from practice notebooks (.ipynb, .py files)
2. **Create Comprehensive Examples**: Include both basic and advanced examples
3. **Add Tables**: Use tables for rules, patterns, operation types, etc.
4. **Include Warnings**: Use panel-warning for common mistakes
5. **Include Tips**: Use panel-note for helpful information
6. **Code Formatting**: Always use proper language tags (python, etc.)

### File Organization

```
Topic-Name/
├── Pratice/           (Practice files - code examples)
│   ├── file1.py
│   └── file2.ipynb
├── Resouce/           (Resource files)
│   ├── xx.pdf
│   ├── yy.pdf
│   └── zz.png
```

### Example Publishing Workflow

1. **Identify Topic**: Look at folder structure
2. **Extract Code**: Read from practice files
3. **Organize Content**: Create logical sections
4. **Create Page**: Use createConfluencePage with HTML content
5. **Handle Images**: 
   - Try to upload images if possible
   - If not possible, add "Upload image X here" placeholder
6. **Add Key Takeaways**: Summarize main points

### Confluence HTML Elements to Use

- **Info Panel**: `<div data-type="panel-info">` for overviews
- **Note Panel**: `<div data-type="panel-note">` for tips
- **Warning Panel**: `<div data-type="panel-warning">` for cautions
- **Code Blocks**: `<pre><code class="language-python">` for code
- **Tables**: `<table>` for references and comparisons
- **Headings**: `<h1>`, `<h2>`, `<h3>` for structure

### Do NOT Include

- Physical PDF file names in content
- "Learning Resources" section with PDF references
- PNG file names as references
- Links to PDF documents
- "Additional Resources" sections mentioning resources folder

### Example Content Structure (What TO Do)

✅ Correct:
```
## Common Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| Counter | Sum values | code here |
```

❌ Incorrect:
```
## Learning Resources
- 📎 50. Section Introduction.pdf
- 📎 51. Introduction to Loops.pdf
```

### Image Placeholder Example

If images cannot be uploaded:
```html
<p>📎 Upload image <strong>string_indexing_diagram.png</strong> here - Shows positive and negative indexing for strings</p>
```

This will remind users to manually add the images later.

---

## Quick Reference

| Step | Action |
|------|--------|
| 1 | Gather PDFs, PNGs, and practice code from context |
| 2 | Extract examples from practice files |
| 3 | Create comprehensive page without mentioning resource files |
| 4 | Upload images directly if possible |
| 5 | Add image placeholders if upload not possible |
| 6 | Publish to Python space homepage |
| 7 | Add key takeaways section |

## Notes

- Always publish to the same space: `Python` space
- Assume parent page is the homepage (295081)
- Use consistent formatting across all pages
- Make content self-contained without external file references

---

## Skill: Commit and Push with Dated Branch

### Purpose
Automatically create a dated branch (DD-MM-YYYY format), commit changes, push to both GitHub and GitLab, and create a Pull Request to `main`.

### Setup Commands

Run these commands once to set up the skill:

```bash
# 1. Add the commit-and-push alias to your git config
git config --local alias.commitpush '!f() {\
  BRANCH_DATE=$(date +%d-%m-%Y);\
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD);\
  if [ "$CURRENT_BRANCH" != "$BRANCH_DATE" ]; then\
    git checkout -b "$BRANCH_DATE" 2>/dev/null || git checkout "$BRANCH_DATE";\
  fi;\
  git add -A;\
  git commit -m "Commit changes - $BRANCH_DATE" || echo "Nothing to commit";\
  git pushboth "$BRANCH_DATE";\
  echo "✅ Pushed to both remotes on branch: $BRANCH_DATE";\
  echo "📋 Creating/checking PR...";\
  GH_AVAILABLE=$(command -v gh >/dev/null 2>&1 && echo "yes" || echo "no");\
  GLAB_AVAILABLE=$(command -v glab >/dev/null 2>&1 && echo "yes" || echo "no");\
  if [ "$GH_AVAILABLE" = "yes" ]; then\
    echo "   GitHub: Checking for existing PR...";\
    PR_CHECK=$(gh pr list --head "$BRANCH_DATE" --json number 2>/dev/null | grep -c "number");\
    if [ "$PR_CHECK" -eq 0 ]; then\
      gh pr create --head "$BRANCH_DATE" --base main --title "Updates from $BRANCH_DATE" --body "Automated PR from dated branch $BRANCH_DATE" 2>/dev/null && echo "   ✅ GitHub PR created" || echo "   ⚠️ Could not create GitHub PR";\
    else\
      echo "   ℹ️ GitHub PR already exists";\
    fi;\
  else\
    echo "   ℹ️ GitHub CLI (gh) not installed - skipping GitHub PR";\
  fi;\
  if [ "$GLAB_AVAILABLE" = "yes" ]; then\
    echo "   GitLab: Checking for existing MR...";\
    MR_CHECK=$(glab mr list --source-branch "$BRANCH_DATE" --json state 2>/dev/null | grep -c "state");\
    if [ "$MR_CHECK" -eq 0 ]; then\
      glab mr create --source-branch "$BRANCH_DATE" --target-branch main --title "Updates from $BRANCH_DATE" --description "Automated MR from dated branch $BRANCH_DATE" 2>/dev/null && echo "   ✅ GitLab MR created" || echo "   ⚠️ Could not create GitLab MR";\
    else\
      echo "   ℹ️ GitLab MR already exists";\
    fi;\
  else\
    echo "   ℹ️ GitLab CLI (glab) not installed - skipping GitLab MR";\
  fi;\
}; f'
```

### Usage

After setup, use these commands in your repository:

```bash
# Commit all changes to today's dated branch and push to both remotes + create PR
git commitpush

# Or manually use the workflow:
git pushboth main          # Push all branches to both remotes
```

### How It Works

1. **Get today's date**: Uses `date +%d-%m-%Y` format (e.g., `17-07-2026`)
2. **Create/switch branch**: Creates a new branch with today's date, or switches to it if it exists
3. **Stage and commit**: Stages all changes and commits with timestamp message
4. **Push to both remotes**: Uses the `pushboth` alias to push to GitHub and GitLab simultaneously
5. **Create PR**:
   - Checks if GitHub PR exists for the branch (requires `gh` CLI)
   - Checks if GitLab MR exists for the branch (requires `glab` CLI)
   - Creates PR/MR only if one doesn't already exist
   - Skips if CLI tools are not installed

### Prerequisites

For full functionality, install these optional tools:

```bash
# GitHub CLI (for GitHub PR creation/checking)
brew install gh

# GitLab CLI (for GitLab MR creation/checking)
brew install glab

# Already configured: pushboth alias (pushes to both GitHub and GitLab)
```

### Example Session

```bash
# Edit files...
$ echo "new content" >> file.txt

# Commit and push to both remotes with PR creation
$ git commitpush
✅ Pushed to both remotes on branch: 17-07-2026
📋 Creating/checking PR...
   GitHub: Checking for existing PR...
   ✅ GitHub PR created
   GitLab: Checking for existing MR...
   ✅ GitLab MR created

# Make more changes on the same date
$ echo "more content" >> file.txt
$ git commitpush
✅ Pushed to both remotes on branch: 17-07-2026
📋 Creating/checking PR...
   GitHub: Checking for existing PR...
   ℹ️ GitHub PR already exists
   GitLab: Checking for existing MR...
   ℹ️ GitLab MR already exists
```

### Features

✅ **Automatic dated branches**: Branch named by today's date (DD-MM-YYYY)
✅ **Reusable branch**: If branch exists, commits go to the same branch on subsequent uses
✅ **Dual push**: Uses `pushboth` alias to push to both GitHub and GitLab in one step
✅ **Smart PR creation**: Only creates PR if one doesn't already exist
✅ **Graceful degradation**: Works without GitHub/GitLab CLI tools (skips PR creation)
✅ **Informative output**: Shows what happened at each step

### Troubleshooting

**PR creation fails**
- Ensure you have `gh` (GitHub) or `glab` (GitLab) CLI installed
- Ensure you are authenticated: `gh auth login` or `glab auth login`
- Check that the branch has been pushed: `git branch -a`

**Branch switching fails**
- Clear git cache: `git remote prune origin && git remote prune gitlab`
- Check branch exists: `git branch -a`

**Push to both remotes fails**
- Verify the `pushboth` alias exists: `git config --get alias.pushboth`
- Check SSH keys are set up: `ssh -T git@github.com` and `ssh -T git@gitlab.com`

