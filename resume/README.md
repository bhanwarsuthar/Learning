# Resume CI/CD

This folder contains your resume source and generated artifacts.

## Files

- `resume.md`: Source file to edit your resume content.
- `resume.css`: Resume styling for HTML output.
- `index.html`: Generated web version copy (auto-generated in GitHub Actions).
- `../docs/index.html`: GitHub Pages root resume page (auto-generated).

## Workflow

Workflow file: `.github/workflows/update_readme.yml`

- PR to `main`/`master`: build/test + generate resume outputs for validation.
- Push to `main`/`master`: build/test + auto-commit generated resume HTML and README updates.
- GitHub Pages root (`/Learning/`) is generated as `docs/index.html` to show your full resume directly.

## How to update resume

1. Edit `resume.md`
2. Open PR
3. Merge PR into `main`
4. Workflow auto-updates `docs/index.html` and `resume/index.html`
