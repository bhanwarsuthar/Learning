# Resume CI/CD

This folder contains your resume source and generated artifacts.

## Files

- `resume.md`: Source file to edit your resume content.
- `resume.css`: Resume styling for both HTML and PDF.
- `index.html`: Generated web version (auto-generated in GitHub Actions).
- `Bhanwar_Suthar_Resume.pdf`: Generated PDF version (auto-generated in GitHub Actions).

## Workflow

Workflow file: `.github/workflows/update_readme.yml`

- PR to `main`/`master`: build/test + generate resume outputs for validation.
- Push to `main`/`master`: build/test + auto-commit generated resume and README updates.
- GitHub Pages root (`/Learning/`) is generated as `docs/index.html` to show your full resume directly.

## How to update resume

1. Edit `resume.md`
2. Open PR
3. Merge PR into `main`
4. Workflow auto-updates `index.html` and `Bhanwar_Suthar_Resume.pdf`
