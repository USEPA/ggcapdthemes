.onLoad <- function(libname, pkgname) {

  if (Sys.info()[1] == "Windows") {
    windowsFonts()
    suppressMessages(extrafont::font_import(paths = system.file("fonts/Source_Sans_3", package="ggcapdthemes"), prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
    windowsFonts()
  } else {
    suppressMessages(extrafont::font_import(paths = system.file("fonts/Source_Sans_3", package="ggcapdthemes"), prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
  }
}
