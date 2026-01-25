# Auto-Update Setup for Commit Count and Coverage

## Overview

This project automatically updates:
1. **GitHub Pages Dashboard** (`https://bhanwarsuthar.github.io/Learning/`) with:
   - Total commit count
   - Code coverage percentage
   - Latest commit information
   - Embedded coverage report

2. **README.md** with:
   - Total commit count
   - Code coverage percentage
   - Last updated timestamp
   - Latest commit SHA

## How It Works

### On Every Commit:

1. **GitHub Actions Workflow** (`.github/workflows/coverage_and_stats.yml`) runs:
   - ✅ Runs all tests with coverage
   - ✅ Generates HTML coverage report
   - ✅ Gets total commit count
   - ✅ Calculates coverage percentage
   - ✅ Gets latest commit information
   - ✅ Creates dynamic `index.html` for GitHub Pages
   - ✅ Deploys to GitHub Pages

2. **README Update Workflow** (`.github/workflows/update_readme.yml`) runs:
   - ✅ Runs tests and generates coverage
   - ✅ Gets commit count and coverage stats
   - ✅ Updates README.md with latest stats
   - ✅ Commits and pushes the updated README

## Setup Instructions

### 1. Enable GitHub Actions

1. Go to repository **Settings** > **Actions** > **General**
2. Under **Workflow permissions**, select:
   - ✅ **Read and write permissions**
   - ✅ **Allow GitHub Actions to create and approve pull requests**
3. Click **Save**

### 2. Enable GitHub Pages

1. Go to repository **Settings** > **Pages**
2. **Source**: Deploy from a branch
3. **Branch**: `gh-pages` (created automatically by workflow)
4. **Folder**: `/ (root)`
5. Click **Save**

### 3. Push Workflow Files

```bash
git add .github/workflows/
git add README.md
git commit -m "Add auto-update workflows for stats and coverage"
git push
```

### 4. Verify

1. Check **Actions** tab - workflows should run automatically
2. Wait for workflows to complete (usually 2-3 minutes)
3. Visit: `https://bhanwarsuthar.github.io/Learning/`
4. You should see:
   - Total commit count
   - Code coverage percentage
   - Latest commit info
   - Embedded coverage report

## Workflow Files

### 1. `coverage_and_stats.yml`
- **Triggers**: Push to main/master, PRs, manual
- **Purpose**: Generate coverage and create GitHub Pages dashboard
- **Output**: `docs/index.html` with stats and coverage

### 2. `update_readme.yml`
- **Triggers**: Push to main/master, manual
- **Purpose**: Update README.md with latest stats
- **Output**: Updated README.md committed back to repo

## Dashboard Features

The GitHub Pages dashboard (`index.html`) includes:

- 📊 **Total Commits**: All-time commit count
- ✅ **Code Coverage**: Current line coverage percentage with badge
- 🔄 **Last Updated**: Timestamp of latest commit
- 📝 **Latest Commit**: SHA, author, date, and message
- 📊 **Coverage Report**: Embedded interactive coverage report
- 🔗 **Quick Links**: Links to interactive viewer and repository

## README Stats Section

The README.md includes a stats table that shows:

```
## 📊 Project Statistics

| Metric | Value | Status |
|--------|-------|--------|
| **Total Commits** | 42 | ✅ Active |
| **Code Coverage** | 90.5% | ✅ Excellent |
| **Last Updated** | 2026-01-24 13:30:00 UTC | 🔄 Auto-updated |
| **Latest Commit** | `a1b2c3d` | 📝 |
```

## Troubleshooting

### Workflows not running

1. Check **Actions** tab for errors
2. Verify GitHub Actions is enabled in repository settings
3. Check workflow file syntax (YAML)
4. Ensure Flutter version matches in workflow

### Stats not updating

1. Check workflow completed successfully
2. Verify `README.md` was updated in Actions log
3. Check if commit was made (workflows don't trigger on their own commits with `[skip ci]`)

### Coverage not showing

1. Verify tests are passing
2. Check `coverage/html/index.html` exists in workflow artifacts
3. Verify GitHub Pages is enabled and pointing to `gh-pages` branch
4. Check browser console for errors

### GitHub Pages not updating

1. Wait 1-2 minutes after workflow completes
2. Clear browser cache
3. Check GitHub Pages settings
4. Verify `gh-pages` branch exists and has content

## Manual Trigger

You can manually trigger workflows:

1. Go to **Actions** tab
2. Select workflow (e.g., "Generate Coverage and Update Stats")
3. Click **Run workflow**
4. Select branch and click **Run workflow**

## Customization

### Change Coverage Thresholds

Edit `.github/workflows/coverage_and_stats.yml`:

```yaml
# In the index.html generation section
if (coverage >= 80) {
    badge = 'Excellent'
} else if (coverage >= 60) {
    badge = 'Good'
}
```

### Change Update Frequency

By default, workflows run on every push. To change:

```yaml
on:
  push:
    branches: [ main, master ]
  schedule:
    - cron: '0 0 * * *'  # Daily at midnight
```

## Notes

- Workflows use `[skip ci]` in commit messages to prevent infinite loops
- Coverage is calculated from `lcov.info` after cleaning
- Commit count includes all commits in repository history
- GitHub Pages updates may take 1-2 minutes to propagate

---

**Last Updated**: Auto-updated on every commit
