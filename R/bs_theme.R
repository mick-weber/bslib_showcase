main_theme <- bslib::bs_theme(version = 5,
  # "navbar-bg" = "cyan",
  bg = "white",
  fg = "darkgrey",
  primary = "black",
  secondary = htmltools::parseCssColors("forestgreen"),
  base_font = bslib::font_google("Righteous")) |>
  # low-level theming
  bslib::bs_add_variables(
    # 2x font-size
    "font-size-base" = "1.25rem",
    # Input widgets' borders assymetrical and yellow
    "input-border-color" = "red",
    "input-border-radius" = "15px 30px",
    # Pad y the text of lg buttons
    "input-btn-padding-y-lg" = "1rem",
    # Pad the outside of the buttons (all)
    "btn-padding-y" = "2rem",
    # Buttons radia
    "btn-border-radius" = "5px 5px",
    "btn-border-radius-lg" = "5px 5px",
    "btn-border-radius-sm" = "5px 5px",
    # test
    "form-select-bg" = "green"
  )
