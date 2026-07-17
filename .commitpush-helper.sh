#!/bin/bash
# commitpush helper script - generates meaningful commits and PRs based on changes

set -e

BRANCH_DATE=$(date +%d-%m-%Y)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
PROJECT_NAME="PythonProject"

# Switch to dated branch if needed
if [ "$CURRENT_BRANCH" != "$BRANCH_DATE" ]; then
    git checkout -b "$BRANCH_DATE" 2>/dev/null || git checkout "$BRANCH_DATE"
    echo "📌 Switched to branch: $BRANCH_DATE"
fi

# Stage all changes
git add -A

# Get a summary of changes
CHANGES=$(git diff --cached --name-only)
CHANGES_COUNT=$(echo "$CHANGES" | grep -c . || echo "0")

if [ "$CHANGES_COUNT" -eq 0 ]; then
    echo "ℹ️ Nothing to commit"
    exit 0
fi

# Generate file summary for commit message
FILES_SUMMARY=$(echo "$CHANGES" | head -5 | tr '\n' ', ' | sed 's/,$//')
if [ "$CHANGES_COUNT" -gt 5 ]; then
    FILES_SUMMARY="$FILES_SUMMARY, and $((CHANGES_COUNT - 5)) more file(s)"
fi

# Get change statistics
INSERTIONS=$(git diff --cached --stat | tail -1 | awk '{print $4}')
DELETIONS=$(git diff --cached --stat | tail -1 | awk '{print $6}')

# Create meaningful commit message
COMMIT_MSG="$BRANCH_DATE: Update $CHANGES_COUNT file(s)"
if [ ! -z "$INSERTIONS" ] && [ ! -z "$DELETIONS" ]; then
    COMMIT_MSG="$COMMIT_MSG (+$INSERTIONS -$DELETIONS)"
fi

# Create detailed description for PR
PR_DESCRIPTION="## Changes on $BRANCH_DATE

**Files Modified**: $CHANGES_COUNT

**Files**:
$(echo "$CHANGES" | sed 's/^/- /')

**Statistics**: +$INSERTIONS -$DELETIONS

---
*Automatically generated PR from dated branch $BRANCH_DATE*"

echo "📝 Commit message: $COMMIT_MSG"
echo "📋 Changes: $CHANGES_COUNT file(s) | +$INSERTIONS -$DELETIONS"

# Commit with meaningful message
git commit -m "$COMMIT_MSG" || echo "⚠️ Commit failed"

# Push to both remotes
git pushboth "$BRANCH_DATE"
echo "✅ Pushed to both remotes on branch: $BRANCH_DATE"

# Handle PR/MR creation and updates
echo "📋 Checking/creating PR & MR..."

# GitHub PR handling
if command -v gh >/dev/null 2>&1; then
    echo "   🔹 GitHub:"

    # Detect GitHub repo from remotes
    GH_REPO=$(git remote get-url github 2>/dev/null | sed 's|.*github.com[:/]||;s|\.git$||' || git remote get-url origin 2>/dev/null | grep github | sed 's|.*github.com[:/]||;s|\.git$||' || echo "")

    if [ -z "$GH_REPO" ]; then
        echo "      ℹ️ GitHub repo not configured in remotes"
    else
        # Check if PR exists
        PR_JSON=$(gh pr list --head "$BRANCH_DATE" --repo "$GH_REPO" --json number,title 2>/dev/null || echo "")

        if [ -z "$PR_JSON" ] || [ $(echo "$PR_JSON" | grep -c "number" || echo "0") -eq 0 ]; then
            # Create new PR
            PR_URL=$(gh pr create --head "$BRANCH_DATE" --base main --title "$COMMIT_MSG" --body "$PR_DESCRIPTION" --repo "$GH_REPO" 2>/dev/null | grep -o "https://[^[:space:]]*" || echo "")
            if [ ! -z "$PR_URL" ]; then
                echo "      ✅ PR created: $PR_URL"
            else
                echo "      ⚠️ Could not create PR"
            fi
        else
            # PR exists - update it
            PR_NUMBER=$(echo "$PR_JSON" | grep -o '"number":[0-9]*' | grep -o '[0-9]*' | head -1)
            if [ ! -z "$PR_NUMBER" ]; then
                # Update PR title and body
                gh pr edit "$PR_NUMBER" --title "$COMMIT_MSG" --body "$PR_DESCRIPTION" --repo "$GH_REPO" 2>/dev/null && \
                    echo "      ✅ PR #$PR_NUMBER updated with new description" || \
                    echo "      ⚠️ Could not update PR"
            fi
        fi
    fi
else
    echo "   ℹ️ GitHub CLI (gh) not installed - skipping GitHub PR"
fi

# GitLab MR handling
if command -v glab >/dev/null 2>&1; then
    echo "   🔹 GitLab:"

    # Check if MR exists
    MR_JSON=$(glab mr list --source-branch "$BRANCH_DATE" --json iid,title 2>/dev/null || echo "")

    if [ -z "$MR_JSON" ] || [ $(echo "$MR_JSON" | grep -c "iid" || echo "0") -eq 0 ]; then
        # Create new MR
        MR_URL=$(glab mr create --source-branch "$BRANCH_DATE" --target-branch main --title "$COMMIT_MSG" --description "$PR_DESCRIPTION" 2>/dev/null | grep -o "https://[^[:space:]]*" || echo "")
        if [ ! -z "$MR_URL" ]; then
            echo "      ✅ MR created: $MR_URL"
        else
            echo "      ⚠️ Could not create MR"
        fi
    else
        # MR exists - update it
        MR_IID=$(echo "$MR_JSON" | grep -o '"iid":[0-9]*' | grep -o '[0-9]*' | head -1)
        if [ ! -z "$MR_IID" ]; then
            # Update MR title and description
            glab mr update "$MR_IID" --title "$COMMIT_MSG" --description "$PR_DESCRIPTION" 2>/dev/null && \
                echo "      ✅ MR !$MR_IID updated with new description" || \
                echo "      ⚠️ Could not update MR"
        fi
    fi
else
    echo "   ℹ️ GitLab CLI (glab) not installed - skipping GitLab MR"
fi

echo ""
echo "✨ Done! Branch: $BRANCH_DATE"

