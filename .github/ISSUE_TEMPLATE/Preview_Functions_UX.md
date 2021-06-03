---
name: UX Preview
about: Create a report to help us improve
title: '[UX] - '
labels: 'UX_Preview'
assignees: 'btardif'

---

# Issue Title

## Description

- Please provide a concise description of the issue
   - Good descriptions include the step necessary to reproduce the issue
   - Expected vs observed behavior

- Include Screenshots if possible
   - make sure to include the whole browser window we need to so see the issue in context.

- Include a network trace  
   - See how to capture a network trace below.
- Include any browser console errors if present

# How to capture browser network trace
- Open Developer Tools (F12 in most browsers)
- Click on the Network Tab
- Refresh browser (F5) - This will clear session caches
- Reproduce the issue
- Export network trace as HAR file
   - Right click on any line item in the network trace should provide this option.
- Zip and attach to issue
