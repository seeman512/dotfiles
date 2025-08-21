-- Authors: Unknown
-- License: Unknown
-- Last Changed: Unknown
--
-- look_tiny.min_tabs.lua: an ion3 style for use with the min_tabs
-- extension, based on:
-- look_tiny.lua: an ion3 style for small screens...like mine :(
-- based on look_minimalist.lua

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    bar_inside_border = true,
    background_colour = "#000000",
    foreground_colour = "#c5c8c6",
    padding_colour = "#505050",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "ridge",
    font = "-*-lucida-medium-r-normal-*-10-*-*-*-*-*-*-*",
    text_align = "left",
    transparent_background = true,
})

de.defstyle("frame", {
    based_on = "*",
    spacing = 0,
})

de.defstyle("frame-tiled", {
    based_on = "frame",
    border_style = "elevated",
    padding_pixels = 0,
    highlight_colour = "#000000",
    shadow_colour = "#000000",
    highlight_pixels = 1,
    shadow_pixels = 1,
    de.substyle("active", {
            padding_colour = "#21212c",
    })
})

de.defstyle("frame-floating", {
    based_on = "frame",
    highlight_colour = "#888888",
    shadow_colour = "#333333",
    highlight_pixels = 0,
    shadow_pixels = 0,
    padding_pixels = 0,
})

de.defstyle("tabstyle", {
    based_on = "*",
    background_colour = "#222222",
    de.substyle("active-unselected", {
            padding_colour = "#6f6f6f",
            background_colour = "#282a2e",
    }),
    de.substyle("inactive-selected", {
            padding_colour = "#f0c674",
            background_colour = "#505050",
    }),
    de.substyle("active-selected", {
            padding_colour = "#f0c674",
            background_colour = "#373B41",
    }),
})

de.defstyle("tab", {
    based_on = "tabstyle",
    spacing = 0,
    padding_pixels=1,
})

de.defstyle("tab-menuentry", {
    based_on = "tabstyle",
    font = "-*-lucida-medium-r-normal-*-12-*-*-*-*-*-*-*",
    text_align = "left",
})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
    font = "-*-lucida-medium-r-normal-*-24-*-*-*-*-*-*-*",
})

de.defstyle("input", {
    based_on = "*",
    padding_pixels = 1,
    font = "-*-lucida-medium-r-normal-*-14-*-*-*-*-*-*-*",
    de.substyle("*-cursor", {
        background_colour = "#00ff00",
        foreground_colour = "#000000",
    }),
    de.substyle("*-selection", {
        foreground_colour = "#707880",
    }),
})

de.defstyle("stdisp", {
    based_on = "tab",
    background_colour = "#000000",
    padding_colour = "#000000",
    de.substyle("important", { foreground_colour = "#ffff00", }),
    de.substyle("critical", { foreground_colour = "#ff0000", }),
    de.substyle("gray", { foreground_colour = "#505050", }),
    de.substyle("red", { foreground_colour = "#ff0000", }),
    de.substyle("green", { foreground_colour = "#00ff00", }),
    de.substyle("blue", { foreground_colour = "#0000ff", }),
    de.substyle("cyan", { foreground_colour = "#00ffff", }),
    de.substyle("magenta", { foreground_colour = "#ff00ff", }),
    de.substyle("yellow", { foreground_colour = "#ffff00", }),
})

gr.refresh()
