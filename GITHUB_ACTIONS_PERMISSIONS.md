# GitHub Actions Permissions Setup

## Issue
The workflow is getting a 403 error when trying to push changes:
```
remote: Permission to bhanwarsuthar/Learning.git denied to github-actions[bot].
fatal: unable to access 'https://github.com/bhanwarsuthar/Learning/': The requested URL returned error: 403
```

## Solution

### 1. Enable Workflow Permissions in Repository Settings

1. Go to your repository on GitHub
2. Click **Settings** > **Actions** > **General**
3. Scroll down to **Workflow permissions**
4. Select:
   - ✅ **Read and write permissions**
   - ✅ **Allow GitHub Actions to create and approve pull requests**
5. Click **Save**

### 2. Workflow Permissions

The workflows now include explicit permissions:

```yaml
permissions:
  contents: write      # Allows pushing commits
  pages: write        # Allows deploying to GitHub Pages
  id-token: write    # Required for GitHub Pages deployment
```

### 3. Verify Token Usage

The workflows use `${{ secrets.GITHUB_TOKEN }}` which is automatically provided by GitHub Actions. This token has the permissions you set in step 1.

### 4. Alternative: Use Personal Access Token (if needed)

If the above doesn't work, you can create a Personal Access Token:

1. Go to GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)
2. Generate a new token with `repo` scope
3. Add it as a secret named `GH_TOKEN` in your repository
4. Update the workflow to use:
   ```yaml
   - uses: actions/checkout@v3
     with:
       fetch-depth: 0
       token: ${{ secrets.GH_TOKEN }}
   ```

## Current Workflow Configuration

Both workflows (`update_readme.yml` and `coverage_and_stats.yml`) now have:
- ✅ Explicit permissions declared
- ✅ Proper token usage
- ✅ Correct git push command

## Testing

After enabling permissions:
1. Push a commit to trigger the workflow
2. Check the Actions tab
3. The workflow should now be able to push changes successfully

---

**Note:** The `[skip ci]` in commit messages prevents infinite loops where the workflow triggers itself.
