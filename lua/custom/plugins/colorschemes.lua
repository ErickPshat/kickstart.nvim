return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'frappe',
        },
        transparent_background = true, -- disables setting the background color.
        float = {
          transparent = false, -- enable transparent floating windows
          solid = true, -- use solid styling for floating windows, see |winborder|
        },
      }
      -- Load the colorscheme here.
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          sidebars = 'transparent',
          floats = 'transparent',
        },
        transparent = true,
      }

      -- Load the colorscheme here.
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
