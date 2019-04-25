library(hexSticker)
library(usethis)
library(showtext)

font_add_google("Gochi Hand", "gochi")
showtext_auto()


hexSticker::sticker("inst/icon.png",
                    package="aliviateR",
                    s_x=1,
                    s_y=.9,
                    s_width=.66,
                    s_height=0.66,
                    p_color = "#08519c",
                    p_size = 6,
                    p_x = 1,
                    p_y = 1.63,
                    p_family = "gochi",
                    h_size = 1.4,
                    h_fill = "#6baed6",
                    h_color = "#3182bd",
                    url = "https://github.com/avalcarcel9/aliviateR",
                    u_size = 1.2,
                    u_color = "white",
                    filename = "inst/sticker.png")

hexSticker::sticker("inst/icon3.png",
                    package="aliviateR",
                    s_x=1,
                    s_y=0.9,
                    s_width=.55,
                    s_height=0.55,
                    p_color = "#f7fbff",
                    p_size = 6,
                    p_x = 1,
                    p_y = 1.6,
                    p_family = "gochi",
                    h_size = 1.4,
                    h_fill = "#00688B",
                    h_color = "#50A6C2",
                    url = "https://github.com/avalcarcel9/aliviateR",
                    u_size = 1.2,
                    u_color = "white",
                    filename = "inst/sticker3.png")


hexSticker::sticker("inst/icon2.png",
                    package="aliviateR",
                    s_x=1,
                    s_y=0.9,
                    s_width=.55,
                    s_height=0.55,
                    p_color = "#f7fbff",
                    p_size = 6,
                    p_x = 1,
                    p_y = 1.6,
                    p_family = "gochi",
                    h_size = 1.4,
                    h_fill = "#3690c0",
                    h_color = "#a6bddb",
                    url = "https://github.com/avalcarcel9/aliviateR",
                    u_size = 1.2,
                    u_color = "white",
                    filename = "inst/sticker2.png")



usethis::use_build_ignore(
  c("inst/icon.png",
    "inst/sticker.R",
    "inst/sticker.png"))
