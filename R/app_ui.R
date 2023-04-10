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
    bslib::page_navbar(
      id = "mainNav",
      title = ("page_navbar title"),
      theme = main_theme,
      header = h5(">>Header's placeholder<<"),# test
      sidebar = bslib::sidebar(position = "left",
                               width = "15%",
                               br(),

        conditionalPanel(condition = "input.mainNav == 'resource2'",
                         radioButtons(inputId = "cond_sidebar_radio",
                                      label = "TestRadio",
                                      choices = c("CondPanel1", "CondPanel2"))),

        radioButtons(
          "select_species", "Species",
          c("Setosa" = "setosa",
            "Versicolor" = "versicolor",
            "Virginica" = "virginica")
        )), # End sidebar()
      bslib::nav_item(tags$a(href="https://www.google.com", "Click here!")),
      bslib::nav_menu(value = "MenuTest1",
                      title = "Test1",
                      bslib::nav("MainPlot"),
                      bslib::nav("subtest2")),
      bslib::nav_menu(
        title = "Resources",
        value = "resources",
        bslib::nav(value = "resource1",
          title = "Resource 1",
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
        bslib::nav(value = "resource2",
                   title = "Resource 2",
                   textOutput("selected_species")),
        bslib::nav(value = "resource3",
                   title = "Resource 3"),
        bslib::nav(value = "resource4",
                   title = "Action buttons", # https://getbootstrap.com/docs/4.0/components/buttons/
          actionButton("secondary_lg", "Sec modded lg", class = "btn-secondary btn-lg"),
          actionButton("secondary_sm", "Secondary sm", class = "btn-secondary btn-sm"),
          actionButton("info_sm", "Info sm", class = "btn-info btn-sm"),
          actionButton("link_active", "Link active", class = "btn-primary"),
          actionButton("link_disabled", "Link disabled", class = "btn-primary disabled")
        )
      ),
      bslib::nav_spacer(),
      bslib::nav_item(tags$a(href = "https://www.google.com", "Contact us !"))
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
