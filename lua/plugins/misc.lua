return {
  { 'Darazaki/indent-o-matic' },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- require('mini.surround').setup {
      --   mappings = {
      --     add = 'ysa', -- Add surrounding in Normal and Visual modes
      --     delete = 'ysd', -- Delete surrounding
      --     find = 'ysf', -- Find surrounding (to the right)
      --     find_left = 'ysF', -- Find surrounding (to the left)
      --     highlight = 'ysh', -- Highlight surrounding
      --     replace = 'ysr', -- Replace surrounding
      --
      --     suffix_last = 'l', -- Suffix to search with "prev" method
      --     suffix_next = 'n', -- Suffix to search with "next" method
      --   },
      -- }

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Surround
    'kylechui/nvim-surround',
  },
  { -- Persistence is a simple lua plugin for automated session management.
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  { -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
    'hedyhli/outline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        -- outline_window = { focus_on_open = false },
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle centered editor' },
    },
    opts = {
      window = {
        backdrop = 0,
        width = 120,
        height = 1,

        -- Important: keep ZenMode below other floating windows
        zindex = 10,

        -- Optional: visible border around the ZenMode window itself
        border = 'none',

        options = {
          signcolumn = 'yes',
          number = true,
          relativenumber = true,
          cursorline = true,
          foldcolumn = '0',
        },
      },

      plugins = {
        options = {
          enabled = false,
        },
        twilight = {
          enabled = false,
        },
        gitsigns = {
          enabled = true,
        },
      },
    },
  },
  { -- GDScript syntax highlighting
    'habamax/vim-godot',
  },
}
