# Repository Guidelines

## Project Structure & Module Organization
- `index.html` contains the page markup and primary content sections.
- `style.css` holds global styles, layout rules, and component classes.
- `script.js` contains the small client-side behavior (CTA click handler).
- `Dockerfile` and `deploy.sh` support containerized deployment to AWS ECR.
- `README.md` documents deployment commands and environment expectations.

## Build, Test, and Development Commands
- `open index.html` (or serve the folder with any static server) to preview the site locally.
- `docker build -t allen-kitchen .` builds the static site image.
- `docker run --rm -p 8080:80 allen-kitchen` serves the site at `http://localhost:8080`.
- `./deploy.sh` builds, tags, and pushes the image to ECR (requires `AWS_ACCOUNT_ID`).

## Coding Style & Naming Conventions
- Use 4-space indentation in HTML, CSS, and JS to match existing files.
- Prefer kebab-case for CSS classes/IDs (e.g., `.menu-section`, `#cta-btn`).
- Keep JavaScript minimal and readable; avoid introducing frameworks unless requested.
- No formatter or linter is configured; keep changes clean and consistent.

## Testing Guidelines
- No automated tests are currently defined.
- Validate UI changes by loading `index.html` in a browser or via the Docker run command.
- If you add scripts or tests, document them in `README.md` and update this guide.

## Commit & Pull Request Guidelines
- Commit messages are short, sentence-style updates (e.g., "Updated readme", "Added docker deployment commands").
- Keep commits focused on one change set.
- PRs should include a short description, testing/validation notes, and screenshots for UI changes.

## Configuration & Deployment Notes
- `deploy.sh` expects `AWS_ACCOUNT_ID` and uses `us-east-1` by default.
- Confirm the ECR repository name (`allen-kitchen`) before pushing images.
