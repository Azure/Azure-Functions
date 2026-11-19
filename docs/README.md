# Publishing Azure Functions updates

This directory is a Jekyll blog compatible with GitHub Pages. Posts are Markdown,
reviewed through pull requests. The site has product and security archives, an
Atom feed at `feed.xml`, and search/social metadata. No announcements are
published by this initial setup.

## Preview locally

Use Ruby 3.3 or later and Bundler (the workflow uses Ruby 3.3):

```sh
cd docs
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

Open <http://127.0.0.1:4000/Azure-Functions/>. To preview unpublished drafts,
add `--drafts` to the serve command. Do not use that flag for production builds.
For a one-time production build, run `bundle exec jekyll build --strict_front_matter`.
Generated output is in `_site/` and must not be committed.

## Write an update

1. Copy `_drafts/example-update.md` to `_posts/YYYY-MM-DD-short-title.md`.
   Create `_posts/` when publishing the first update.
2. Replace the template text and front matter. Set `categories: [product]` or
   `categories: [security]`, or both. Add a new category page before using any
   other category.
3. Use a publication date in UTC. For precise timing, add a quoted front-matter
   `date`, for example `date: "2026-12-01 15:00:00 +0000"`. Future-dated posts
   are excluded; they become visible on the first site rebuild after their date,
   not automatically at that time.
4. Preview the page, links, category archive, and feed. For images, place files in
   `assets/images/` and use `{{ '/assets/images/file.png' | relative_url }}` in
   Markdown links. Use `relative_url` for internal links so the repository path
   works locally and on Pages.
5. Open a pull request and obtain the appropriate editorial/product review.
   Merge only when the announcement is approved for public release.

Drafts and pull requests in this public repository are **public**, even though
`_drafts/` is excluded from the generated site. Never put confidential plans,
embargoed announcements, credentials, or undisclosed vulnerabilities here.
Follow [SECURITY.md](../SECURITY.md) and coordinate security communications with
MSRC before publishing. Link to approved public advisories rather than using
the blog as a vulnerability-reporting channel.

For substantive edits to an existing post, add a quoted ISO 8601
`last_modified_at` timestamp and explain the correction in the article. Keep the
filename and URL stable so existing links and feed entries continue to work.

## Build and deployment

The site is published by the GitHub Actions workflow
[`.github/workflows/pages.yml`](../.github/workflows/pages.yml). In
**Settings > Pages**, **Build and deployment > Source** must be set to
**GitHub Actions**.

- Pull requests that change `docs/**` build the site and upload a preview artifact,
  without deploying.
- Merges to `main` that change `docs/**` build and deploy the site.
- **Actions > Updates blog (GitHub Pages) > Run workflow** redeploys manually,
  for example to publish a future-dated post after its date.

The expected site URL is <https://azure.github.io/Azure-Functions/>. If a custom
domain is configured, update `url` and `baseurl` in `_config.yml` to match.

The workflow builds using the versions locked in `Gemfile.lock`, the same as
local previews. No personal access token or Azure resources are required.
Restrict the `github-pages` environment to the `main` branch under
**Settings > Environments**.

The blog, deployment workflow, and CODEOWNERS file have designated code owners.
Require code-owner reviews in branch protection to enforce approval by at least
one owner. The CODEOWNERS file applies to pull requests after it is merged to
their base branch. Security announcements still require the appropriate MSRC
coordination; code-owner approval alone does not enforce that process.
