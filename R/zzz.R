.onLoad <- function(libname, pkgname) {
  # if (Sys.info()[1] == "Linux") {
  #   dir.create('~/.fonts')
  #   file.copy("inst/fonts/Source_Sans_3/some-fonts.ttf", "~/.fonts")
  #   system('fc-cache -f ~/.fonts')
  # }
  if (Sys.info()[1] == "Windows") {
    windowsFonts()
    suppressMessages(extrafont::font_import("inst/fonts/Source_Sans_3", prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
    windowsFonts()
  } else {
    suppressMessages(extrafont::font_import(paths = system.file("fonts/Source_Sans_3", package="ggcapdthemes"), prompt = FALSE))
    extrafont::loadfonts(quiet = TRUE)
  }
  #print(extrafont::fonts())
}

#
# db_path <- paste0(system.file(package = "extrafontdb"),"/fontmap/fonttable.csv")
# file.show(db_path)
