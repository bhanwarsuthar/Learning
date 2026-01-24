# GitHub Pages Setup for Coverage Report

## Problem

The coverage report wasn't working on GitHub Pages because:
1. The `coverage/` directory is in `.gitignore`
2. Coverage files weren't being deployed to GitHub Pages
3. The viewer was looking for files in the wrong path

## Solution

### Automatic (Recommended) - GitHub Actions

A GitHub Actions workflow (`.github/workflows/coverage.yml`) has been created that:

1. ✅ Runs tests with coverage on every push
2. ✅ Generates HTML coverage report
3. ✅ Copies coverage files to `docs/coverage/`
4. ✅ Deploys to GitHub Pages automatically

### Setup Steps

1. **Enable GitHub Pages:**
   - Go to repository Settings > Pages
   - Source: Deploy from a branch
   - Branch: `gh-pages` (will be created automatically)
   - Folder: `/ (root)`
   - Click Save

2. **Enable GitHub Actions:**
   - Go to repository Settings > Actions > General
   - Under "Workflow permissions", select "Read and write permissions"
   - Check "Allow GitHub Actions to create and approve pull requests"
   - Click Save

3. **Push the workflow file:**
   ```bash
   git add .github/workflows/coverage.yml
   git commit -m "Add GitHub Actions workflow for coverage"
   git push
   ```

4. **Wait for workflow to complete:**
   - Go to Actions tab in your repository
   - The workflow will run automatically on push
   - Once complete, coverage will be available at:
     `https://bhanwarsuthar.github.io/Learning/coverage_viewer.html`

### Manual Setup (Alternative)

If you prefer to generate coverage manually:

1. **Generate coverage locally:**
   ```bash
   ./generate_coverage_standalone.sh
   ```

2. **Copy to docs directory:**
   ```bash
   mkdir -p docs/coverage
   cp -r coverage/html/* docs/coverage/
   cp coverage_viewer.html docs/coverage_viewer.html
   ```

3. **Commit and push:**
   ```bash
   git add docs/
   git commit -m "Add coverage report for GitHub Pages"
   git push
   ```

4. **Configure GitHub Pages:**
   - Go to Settings > Pages
   - Source: Deploy from a branch
   - Branch: `main` or `master`
   - Folder: `/docs`
   - Click Save

## File Structure After Setup

```
repository/
├── .github/
│   └── workflows/
│       └── coverage.yml          # Auto-generates coverage
├── docs/                          # GitHub Pages source
│   ├── coverage/
│   │   └── html/                 # Coverage HTML files
│   │       └── index.html
│   └── coverage_viewer.html      # Interactive viewer
├── coverage_viewer.html           # Local viewer
└── README.md
```

## Testing Locally

Before pushing, test the viewer locally:

```bash
# Generate coverage
./view_coverage.sh

# Start a local server
cd docs
python3 -m http.server 8000

# Open in browser
open http://localhost:8000/coverage_viewer.html
```

## Troubleshooting

### Coverage report not showing

1. Check GitHub Actions workflow ran successfully
2. Verify `docs/coverage/html/index.html` exists
3. Check GitHub Pages is enabled and pointing to correct branch/folder
4. Clear browser cache and try again

### GitHub Actions failing

1. Check Flutter version matches in workflow
2. Verify all dependencies are in `pubspec.yaml`
3. Check Actions tab for error messages
4. Ensure GitHub Pages is enabled

### Path issues

The viewer now tries multiple paths:
- `/{repo}/coverage/html/index.html` (GitHub Pages)
- `./coverage/html/index.html` (local)
- `../coverage/html/index.html` (alternative)

## Next Steps

1. ✅ Push the workflow file
2. ✅ Enable GitHub Pages
3. ✅ Wait for first workflow run
4. ✅ Verify coverage report loads at: `https://bhanwarsuthar.github.io/Learning/coverage_viewer.html`

---

**Note:** The coverage report will be automatically updated on each push to main/master branch.
