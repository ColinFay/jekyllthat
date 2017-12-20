
<!-- README.md is generated from README.Rmd. Please edit that file -->

<https://img.shields.io/badge/lifecycle-experimental-orange.svg>

# jekyllthat

Basic RMarkdown to Github Flavored Jekyll, used to write posts on a blog
hosted on GitHub.

## About

If ever you start a blog today, you definitely should use
[Blogdown](https://github.com/rstudio/blogdown), which is a better tool
to create a blog within RStudio.

But if (as me), you haven’t had the time to convert your blog to
Blogdown, this package is here to help you being more efficient with
RStudio and Jekyll. This is the package I use for
[colinfay.me](colinfay.me).

{jekyllthat} contains :

  - An RStudio Rmd template that you can get from New File \> RMarkdown
    \> From Template

  - A Markdown format to turn Rmd into a github md for Jekyll. If you’re
    not using the template, add to your Rmd yaml :

`output: jekyllthat::jekylldown`

## Before using

If you want to keep your Rmd inside `_posts`, you should add to your
config.yml, in the exclude part :

  - “\*.Rmd"

## Misc

## Contact

Questions and feedbacks [welcome](mailto:contact@colinfay.me)\!

You want to contribute ? Open a
[PR](https://github.com/ColinFay/jekyllthat/pulls) :) If you encounter a
bug or want to suggest an enhancement, please [open an
issue](https://github.com/ColinFay/jekyllthat/issues).

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
