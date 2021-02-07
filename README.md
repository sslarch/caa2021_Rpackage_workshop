# Developing R Packages

This workshop by the [CAA–SIG Scientific Scripting Languages in Archaeology](https://sslarch.github.io) at [CAA2021, Cyprus](https://2021.caaconference.org) will offer a low-level introduction to R package development. The workshop is complementary to the session 
[Tools for the Revolution: developing packages for scientific programming in archaeology](https://github.com/sslarch/caa2021_packages).

## What we will do

In this workshop we will focus on the main points in Hadley Wickham's book on package development ([Wickham 2020](https://r-pkgs.org)) and create an example application together. Workshop attendees will get to know a structured workflow, which will aid them in organizing their personal scripts afterwards. Main topics include function definition in R, the R package structure and the typical package development cycle. If time allows, we will also introduce topics like vignettes, unit tests or shipping data with packages.

## What you have to bring

Basic R knowledge is strongly recommended. Beyond that we ask you to install the following software on the computer you use to participate in the workshop:

- [R](https://cran.rstudio.com/)
- [RStudio Desktop](https://rstudio.com/products/rstudio/download/#download)
- For Windows users: [Rtools](https://cran.r-project.org/bin/windows/Rtools)

To test if your R setup is ready for package development, you can try to install a package from Github.

```
if(!require('remotes')) install.packages('remotes')
remotes::install_github("r-lib/devtools")
```

Devtools is also the main package we will need for the workshop.

## Regarding your application "abstract"

CAA2021 does not have a formal workshop category, unfortunately, so we submitted this workshop as a session of type "other". If you want to participate in this workshop, you have to hand in a "paper". Of course this formal requirement is not relevant for a workshop, so we would like to ask you to instead submit some lines about your personal level of experience with R. Then we can adjust the workshop according to your skill level.
