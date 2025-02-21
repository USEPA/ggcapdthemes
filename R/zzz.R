
## function that runs on package load
## goal: install and load Sans source 3 fonts from inst/fonts folder
.onLoad <- function(libname, pkgname) {

  if (Sys.info()[1] == "Windows") {
    grDevices::windowsFonts()
    suppressMessages(extrafont::font_import(paths = system.file("fonts/Source_Sans_3", package="ggcapdthemes"), prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
    grDevices::windowsFonts()
  } else {
    suppressMessages(extrafont::font_import(paths = system.file("fonts/Source_Sans_3", package="ggcapdthemes"), prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
  }
}
