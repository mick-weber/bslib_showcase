main_theme <- bslib::bs_theme(version = 5,
  # "navbar-bg" = "cyan",
  bg = "#222222",
  fg = "#e12885",
  primary = "cyan",
  secondary = htmltools::parseCssColors("forestgreen"),
  base_font = bslib::font_google("Righteous")) |>
  # low-level theming
  bslib::bs_add_variables(
    # 2x font-size
    "font-size-base" = "2rem",
    # Input widgets' borders assymetrical and yellow
    "input-border-color" = "yellow",
    "input-border-radius" = "15px 30px",
    # Pad y the text of lg buttons
    "input-btn-padding-y-lg" = "10rem",
    # Pad the outside of the buttons (all)
    "btn-padding-y" = "20rem",
    # Buttons radiuses
    "btn-border-radius" = "30px 15px",
    "btn-border-radius-lg" = "5px 40px",
    "btn-border-radius-sm" = "50px 5px"
  )
