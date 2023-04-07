#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage(
      h1("Navbar!"),
      theme = main_theme,
      tabPanel(
        "Plot",
        sidebarLayout(

          sidebarPanel(radioButtons(
            "select_species", "Species",
            c("Setosa" = "setosa",
              "Versicolor" = "versicolor",
              "Virginica" = "virginica")
          )),
          mainPanel(plotOutput("plot"))
        )
      ),
      navbarMenu(
        title = "Ressources",
        tabPanel(
          "Options test",
          selectizeInput(
            "test",
            "Test :",
            c(
              "Label1" = "label1",
              "Label2" = "label2",
              "Label2" = "label3"
            )
          )
        ),
        tabPanel(
          "Action buttons", # https://getbootstrap.com/docs/4.0/components/buttons/
          actionButton("secondary_lg", "Sec modded lg", class = "btn-secondary btn-lg"),
          actionButton("secondary_sm", "Secondary sm", class = "btn-secondary btn-sm"),
          actionButton("info_sm", "Info sm", class = "btn-info btn-sm"),
          actionButton("link_active", "Link active", class = "btn-primary"),
          actionButton("link_disabled", "Link disabled", class = "btn-primary disabled")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "bslibShowcase"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
