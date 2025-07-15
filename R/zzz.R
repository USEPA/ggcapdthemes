
## function that runs on package load
## goal: install and load Sans source 3 fonts from inst/fonts folder
.onLoad <- function(libname, pkgname) {

    ## load OTF font files
    systemfonts::add_fonts(files = list.files(system.file("fonts/Source_Sans_3/static/", package="ggcapdthemes"), full.names = TRUE))

    if(!("Source Sans 3" %in% systemfonts::system_fonts()$family)){
      systemfonts::register_font(
        'Source Sans 3',
        plain = 'inst/fonts/Source_Sans_3/static/SourceSans3-Regular.otf',
        bold = 'inst/fonts/Source_Sans_3/static/SourceSans3-Bold.otf',
        italic = 'inst/fonts/Source_Sans_3/static/SourceSans3-It.otf',
        bolditalic = 'inst/fonts/Source_Sans_3/static/SourceSans3-BoldIt.otf'
      )
    }
    ## add variant for SALT styling of letters
    systemfonts::register_variant(
      name = "Source Sans 3 Salt",
      family = "Source Sans 3",
      features = systemfonts::font_feature(
        letters = "stylistic"
      )
    )

  }
