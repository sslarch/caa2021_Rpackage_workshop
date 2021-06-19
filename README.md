# Developing R Packages

This workshop by the [CAA–SIG Scientific Scripting Languages in Archaeology](https://sslarch.github.io) given at [CAA2021, Cyprus](https://2021.caaconference.org) offers a low-level introduction to R package development. The workshop was complementary to the session 
[Tools for the Revolution: developing packages for scientific programming in archaeology](https://github.com/sslarch/caa2021_packages) at the conference.

The slides are available as .pdf in [`rendered_slides`](rendered_slides).

## What this workshop covers

In this workshop we focused on the main points in Hadley Wickham's book on package development ([Wickham 2020](https://r-pkgs.org)) and created an example application together. Workshop attendees will get to know a structured workflow, which will aid them in organizing their personal scripts afterwards. Main topics include function definition in R, the R package structure and the typical package development cycle. If time allows, we will also introduce topics like vignettes, unit tests or shipping data with packages.

## What you need to code along

Basic R knowledge is strongly recommended. Beyond that you need the following software on the computer you use to participate in the workshop:

- [R](https://cran.rstudio.com/)
- [RStudio Desktop](https://rstudio.com/products/rstudio/download/#download)
- For Windows users: [Rtools](https://cran.r-project.org/bin/windows/Rtools)

To test if your R setup is ready for package development, you can try to install a package from Github.

```
if(!require('remotes')) install.packages('remotes')
remotes::install_github("r-lib/devtools")
```

Devtools is also the main package we will need for the workshop.
