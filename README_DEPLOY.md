# James Casserly Portfolio Website

This is a static portfolio website prepared for this repository:

https://github.com/jcasser4/James-Casserly-Portfolio.git

It is ready for GitHub Pages and does not need a build step.

## What is included

- `index.html` - the full portfolio website
- `styles.css` - responsive styling
- `script.js` - mobile menu, project filters, and hash behavior
- `assets/projects/` - optimized project images rendered from the portfolio PDF
- `assets/James-Casserly-Portfolio-2025.pdf` - downloadable public PDF portfolio, with phone number removed from the final page
- `.nojekyll` - tells GitHub Pages to publish the static files as-is

## Upload target

Repository: `jcasser4/James-Casserly-Portfolio`
Likely GitHub Pages URL after publishing: `https://jcasser4.github.io/James-Casserly-Portfolio/`

## Browser upload instructions

1. Unzip this folder.
2. Go to `https://github.com/jcasser4/James-Casserly-Portfolio`.
3. Click **Add file > Upload files**.
4. Upload the CONTENTS of this folder, not the folder itself and not the zip.
5. Confirm these items are at the top level of the repo:
   - `index.html`
   - `styles.css`
   - `script.js`
   - `assets/`
   - `.nojekyll`
6. Commit directly to `main`.
7. Go to **Settings > Pages**.
8. Set **Source** to **Deploy from a branch**.
9. Select branch `main` and folder `/root`, then save.

## Terminal push instructions

From the folder containing this website package:

```bash
git clone https://github.com/jcasser4/James-Casserly-Portfolio.git
cd James-Casserly-Portfolio
cp -R ../james-casserly-repo-ready/. .
git add .
git commit -m "Add portfolio website"
git branch -M main
git push -u origin main
```

Then enable GitHub Pages in **Settings > Pages** using `main` and `/root`.

## Local preview

Open `index.html` in a browser.
