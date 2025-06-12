return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        auto_expand_width = true,
        mappings = {
          ["/"] = "noop", -- Disable the default mapping
        },
      })

      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        filtered_items = {
          visible = true,
          never_show = {
            ".DS_Store",
            "thumbs.db",
            ".cache",
            ".git",
            ".github",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      })

      opts.group_empty_dirs = true

      return opts
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- Add a custom keymap for normal mode search in Neo-tree buffer
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function() vim.api.nvim_buf_set_keymap(0, "n", "/", "/", { noremap = true, silent = true }) end,
      })
    end,
  },
}
