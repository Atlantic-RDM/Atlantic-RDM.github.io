This is the website for the RDM in Atlantic Candaa event happening in September 2026.

**Make sure your `.gitignore` file is properly configured. We don't want to see your `.Rproj.user` file, your `.DS_Store` file if you're on a mac, or any other hidden or personal files you may have in your directory :)**

## Using this Repository

This website uses the [RMarkdown Website Generator](https://bookdown.org/yihui/rmarkdown/websites.html). Pages are written in RMarkdown (when code rendering is required) or Markdown (when no code rendering is required). Each page requires YAML frontmatter to be properly processed.

The website is fed from the `docs/` directory. During development, output will be directed to the `website/` directory, so that `docs/` can hold the 'save the date' information.


## RMarkdown Package

You will need to have the `rmarkdown` package installed.

```
install.packages('rmarkdown')
```

To generate the site, from within `RStudio` you can simply use the `Build Website` button on the `Build` tab in your`Environment` pane.

A few notes:

* If you need to load external scripts not part of your RMarkdown document, place these in the `scripts` directory.
* If you need to reference external files, place these in the `files` directory.
* If you need to non-hyperlinkable images, plase these in the `images` directory.

## Merge Conflicts

These can be particularly challenging to handle in this environment as the html output is also tracked by `git`. Here's the suggested workflow.

* Conduct all of your work in a `branch`. Build in that branch to test.
* `add` and `commit` only the files you edit, but nothing in the `docs` directory.
* Switch to `main` and pull to ensure you're up to date with `remote`.
* `merge` your `branch` to `main`.
* Build the site.
* `add`, `commit`, `push`.
* Cross your fingers.

## YAML

YAML is a serialized language comprised of key value pairs, in essence, this means spaces are significant. Key value pairs are seperated by a colon and space `: ` and indenting of additional arguments uses a tab. The entire thing is wrapped in three back dashes `---`

```
---
title: page title
output:
  html_document:
    toc: TRUE
---
```

## _site.yml

Site level paramters are defined in this YAML file. Likely the most relevant part of this file is the `navbar` key.

```
---
navbar:
  - text: "navigation text title"
    href: link # use the name of the .Rmd file, but change the extenstion to .html
  - text:  "navigation link title"
    menu: # start a drop down menu
      - text: "navigation link title"
        href: link
---
```


