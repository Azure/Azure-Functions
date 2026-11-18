# Publishing Azure Functions updates

This directory is a Jekyll blog compatible with GitHub Pages. Posts are Markdown,
reviewed through pull requests. The site has product and security archives, an
Atom feed at `feed.xml`, and search/social metadata. No announcements are
published by this initial setup.

## Preview locally

Use Ruby 3.1 or later and Bundler (the repository also works with the older
Jekyll 3.10 version used by GitHub Pages):

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

## Enable GitHub Pages later

Pages has deliberately not been enabled by this local setup.

After review and merge into `main`, a repository administrator can:

1. Open **Settings > Pages**.
2. Under **Build and deployment**, select **Deploy from a branch**.
3. Select branch **main** and folder **/docs**, then save.
4. Wait for the Pages build/deployment to finish and use the URL shown in Settings.

The expected default URL is <https://azure.github.io/Azure-Functions/>. If GitHub
shows a different URL, or a custom domain is configured, update `url` and
`baseurl` in `_config.yml` to match. Organization policy may require an
administrator to allow Pages first.

Subsequent merged post changes trigger GitHub's built-in Jekyll build and Pages
deployment. No custom deployment workflow, personal access token, or Azure
resources are required. The Gemfile pins the Jekyll/plugin release lines for
local previews; branch-based Pages uses GitHub's managed dependency versions.

Use existing branch protection or rulesets to require pull-request review on
`main`. This setup does not change repository protections, assign reviewers, or
enforce security approval. Those policies must be configured by maintainers.
