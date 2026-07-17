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
Automatically create a dated branch (DD-MM-YYYY format), analyze changes, generate meaningful commit messages and PR descriptions, push to both GitHub and GitLab, and create/update Pull Requests to `main`.

### Key Features

✅ **Smart commit messages**: Analyzes changes and creates meaningful commit messages like `17-07-2026: Update 5 file(s) (+123 -45)`
✅ **Detailed PR descriptions**: Includes file list, statistics, and changes summary
✅ **PR/MR management**: Creates PR/MR on first commit, updates description on subsequent commits
✅ **Automatic dated branches**: Branch names follow DD-MM-YYYY format (e.g., `17-07-2026`)
✅ **Reusable branches**: Multiple commits on the same date stay on the same branch
✅ **Dual push**: Uses `pushboth` alias to push to both GitHub and GitLab in one step
✅ **Graceful degradation**: Works without GitHub/GitLab CLI tools

### Setup

The skill is already configured (files created):
- **Helper script**: `.commitpush-helper.sh` - Generates meaningful messages and manages PRs
- **Git alias**: `commitpush` - Triggers the helper script

No manual setup needed! Just start using it.

### Usage

```bash
# Make changes to your files
echo "new content" >> file.txt
echo "more changes" >> another_file.py

# Commit, push to both remotes, and create/update PR
git commitpush
```

### How It Works

1. **Get today's date**: Uses `date +%d-%m-%Y` format (e.g., `17-07-2026`)
2. **Create/switch branch**: Creates or switches to a branch named with today's date
3. **Stage all changes**: `git add -A`
4. **Analyze changes**: 
   - Counts modified files
   - Calculates insertions/deletions
   - Generates file summary
5. **Create meaningful commit message**: 
   - Format: `DD-MM-YYYY: Update X file(s) (+insertions -deletions)`
   - Example: `17-07-2026: Update 5 file(s) (+123 -45)`
6. **Commit**: Uses the generated meaningful message
7. **Push to both remotes**: GitHub and GitLab simultaneously
8. **Manage PR/MR**:
   - **First commit**: Creates new PR with full description including:
     - List of modified files
     - Change statistics
     - Branch info
   - **Subsequent commits**: Updates PR/MR description with new file list and stats
   - Only attempts if CLI tools (`gh` or `glab`) are installed

### Example Session

```bash
# First commit on a new date
$ echo "feature: new parser" >> parser.py
$ echo "fix: update docs" >> README.md
$ git commitpush

📌 Switched to branch: 17-07-2026
📝 Commit message: 17-07-2026: Update 2 file(s) (+10 -2)
📋 Changes: 2 file(s) | +10 -2
✅ Pushed to both remotes on branch: 17-07-2026
📋 Checking/creating PR & MR...
   🔹 GitHub:
      ✅ PR created: https://github.com/.../pull/1
   🔹 GitLab:
      ✅ MR created: https://gitlab.com/.../merge_requests/1

✨ Done! Branch: 17-07-2026
```

```bash
# More changes on the same day
$ echo "refactor: cleanup code" >> parser.py
$ echo "test: add new tests" >> tests/test_parser.py
$ git commitpush

📝 Commit message: 17-07-2026: Update 3 file(s) (+25 -8)
📋 Changes: 3 file(s) | +25 -8
✅ Pushed to both remotes on branch: 17-07-2026
📋 Checking/creating PR & MR...
   🔹 GitHub:
      ✅ PR #1 updated with new description
   🔹 GitLab:
      ✅ MR !1 updated with new description

✨ Done! Branch: 17-07-2026
```

### PR Description Format

Each PR/MR includes:
```
## Changes on 17-07-2026

**Files Modified**: 5

**Files**: 
- parser.py
- README.md
- tests/test_parser.py
- config.yaml
- docs/guide.md

**Statistics**: +123 -45

---
*Automatically generated PR from dated branch 17-07-2026*
```

### Prerequisites

For PR/MR creation and updates, install optional CLI tools:

```bash
# GitHub PR management
brew install gh
gh auth login

# GitLab MR management
brew install glab
glab auth login
```

Without these tools, the skill still works—it commits and pushes, but skips PR/MR creation.

### File Structure

```
.commitpush-helper.sh    # Helper script that generates messages and manages PRs
.git/config              # Contains the `commitpush` alias (calls the helper script)
```

### Advanced: Manual PR/MR Management

If you need to manually create or update a PR/MR:

```bash
# GitHub PR
gh pr create --head 17-07-2026 --base main --title "Your title" --body "Your description"
gh pr edit <PR_NUMBER> --title "New title" --body "New description"

# GitLab MR
glab mr create --source-branch 17-07-2026 --target-branch main --title "Your title" --description "Your description"
glab mr update <MR_IID> --title "New title" --description "New description"
```

### Troubleshooting

**PR/MR not created**
- Install GitHub/GitLab CLI: `brew install gh` and/or `brew install glab`
- Authenticate: `gh auth login` / `glab auth login`
- Check branch exists: `git branch -a`

**Helper script not found**
- Ensure you're in the repository root: `cd /Users/subarnasekharmuni/PycharmProjects/PythonProject`
- Verify script exists and is executable: `ls -la .commitpush-helper.sh`
- The alias uses git's rev-parse to find the script

**Commits not being made**
- Check for syntax errors: `bash .commitpush-helper.sh 2>&1 | head -20`
- Ensure you have staged changes: `git status`

**Push fails**
- Verify SSH keys: `ssh -T git@github.com` and `ssh -T git@gitlab.com`
- Check pushboth alias: `git config --get alias.pushboth`

