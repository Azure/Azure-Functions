# Publishing Azure Functions updates

This directory is a Jekyll blog compatible with GitHub Pages. Posts are Markdown,
reviewed through pull requests. Like the App Service team blog, the homepage lists
recent posts with dates, authors, reading times, and excerpts. Top navigation
groups articles by three reserved tags: **product**, **security**, and **engineering**.
The site also has an Atom feed at `feed.xml` and search/social metadata.

## Preview locally

Use Ruby 3.3 or later and Bundler (the workflow uses Ruby 3.3):

```sh
cd docs
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

Open <http://127.0.0.1:4000/Azure-Functions/>.
For a one-time production build, run `bundle exec jekyll build --strict_front_matter`.
Generated output is in `_site/` and must not be committed.

## Write an update

1. Add a file named `_posts/YYYY-MM-DD-short-title.md`. All articles belong in
   `_posts/`; there is no drafts folder or separate draft-preview mode.
2. Use the template below. Include at least one reserved tag: `product` for
   product announcements, `security` for public security updates, or `engineering`
   for technical deep dives. Multiple reserved tags list the article in multiple
   tabs. Additional descriptive tags are allowed but do not create navigation tabs.
3. Use a current or past publication date in UTC. Future-dated posts and
   `published: false` are rejected by the build check because Jekyll hides them.
   Keep work in a pull request until it is ready to publish.
4. Preview the page, topic archive, and feed. For images, place files in
   `assets/images/` and use `{{ '/assets/images/file.png' | relative_url }}` in
   Markdown links. Use `relative_url` for internal links so the repository path
   works locally and on Pages.
5. Open a pull request and obtain the appropriate editorial/product review.
   Merge only when the announcement is approved for public release.

```markdown
---
title: "Your announcement title"
description: "A short summary for the homepage and search engines."
author: "Your name"
tags: [product]
---

Describe what changed, who is affected, and any action required.
Link to the relevant documentation or published advisory.
```

For example, `_posts/2026-11-19-java4shell-security-update.md` is published at
`/Azure-Functions/2026/11/19/java4shell-security-update/`, on the homepage, in the
Security tab, and in the RSS feed. Use lowercase tag names exactly as shown above;
`categories` does not control the tabs.

Pull requests in this public repository are **public**. Never put confidential plans,
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
- Merges to `main` that change `docs/**` immediately build and deploy the site.
- **Actions > Updates blog (GitHub Pages) > Run workflow** redeploys manually.

After building, the workflow runs
`bundle exec ruby ../.github/scripts/validate-blog.rb ../_site` from `docs/`.
This rejects drafts, excluded posts, and missing reserved tags, and checks that
every article appears on the homepage and exactly the topic archives it is tagged
with. Run the same command locally after building to `../_site`, or omit the
destination argument to check the default `docs/_site/` output.

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
