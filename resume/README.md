# Resume CI/CD

This folder contains your original resume PDF and generated web artifacts.

## Files

- `Bhanwar_Suthar_Resume.pdf`: Source resume file used to publish the live page.
- `index.html`: Generated web version copy (auto-generated in GitHub Actions).
- `../docs/index.html`: GitHub Pages root resume page (auto-generated).
- `../docs/resume.png`: Rendered full resume image for direct reading.

## Workflow

Workflow file: `.github/workflows/update_readme.yml`

- PR to `main`/`master`: build/test + generate resume web output for validation.
- Push to `main`/`master`: build/test + auto-commit generated resume page artifacts.
- GitHub Pages root (`/Learning/`) shows your resume directly with no extra navigation.

## How to update resume

1. Replace `Bhanwar_Suthar_Resume.pdf` with your latest resume.
2. Open PR.
3. Merge PR into `main`.
4. Workflow auto-updates `docs/index.html`, `docs/resume.png`, and `index.html`.
