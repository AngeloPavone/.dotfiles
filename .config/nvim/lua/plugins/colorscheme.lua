return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = "none" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
