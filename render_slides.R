# render the Rmd files in slides/ to pdf documents in rendered_slides/

Map(
  \(x) rmarkdown::render(x, output_dir = "rendered_slides"),
  list.files("slides", pattern = ".Rmd", full.names = T)
)
