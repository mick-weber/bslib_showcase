#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  bslib::bs_themer() # Live theming

  thematic::thematic_shiny(bg = bslib::bs_get_variables(theme = main_theme,
                                                        varnames = "fg"))

  output$selected_species <- renderText({
    paste0("You have selected...", input$select_species)
  })

  output$plot <- renderPlot(

    iris |>
      dplyr::filter(Species == input$select_species) |>
      ggplot2::ggplot()+
      ggplot2::geom_bar(ggplot2::aes(Species))

  )

}

