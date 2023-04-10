# test access nested nav() from JS conditionalPanel condition

library(shiny)
library(bslib)

ui <- page_navbar(
  title = "Minimal Example Issue",
  id = "tabx",
  sidebar = sidebar(

    bslib::navs_pill_list(id = "navsPillList",
                          header =  "SidebarNavPillHeader",
                          footer = "SidebarNavPillFooter",
                          widths = c(12,12),
                          nav(value = "navPill_1", title = "Nav Pill 1"),
                          nav(value = "navPill_2", title = "Nav Pill 2"),
                          nav(value = "navPill_3", title = "Nav Pill 3")),

    br(),

    conditionalPanel(
      condition = "input.tabx == 'nestedNav2'",
      radioButtons(inputId = "radio_sidebar_cond",
                   label = "NavMenu1>NestedNav2 Only",
                   choices = c("Yeah", "Nope", "Maybe"))
    )

  ),
  header =
    tagList(
      conditionalPanel(
        condition = "input.tabx == 'nestedNav1'",
        HTML("Special Header for nestedNav1")
      ),
      conditionalPanel(
        condition = "input.navsPillList == 'navPill_2'",
        HTML("Only when navPill_2 is selected !")
      )
  ),# end header tagList
  nav(title = "tab_1", value = "tab_1_value", "Hello"),
  nav(title = "tab_2", value = "tab_2_value", "Hi") ,
  nav_menu(title = "NavMenu1", value = "navMenu1",
           nav(value = "nestedNav1", title = "Nested1"),
           nav(value = "nestedNav2", title = "Nested2"))
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
