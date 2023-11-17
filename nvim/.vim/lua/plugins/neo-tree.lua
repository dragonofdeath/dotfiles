
require("neo-tree").setup({
  window = {
    mappings = {
      -- ["-"] = "navigate_up",
      ["[c"] = "prev_git_modified",
      ["]c"] = "next_git_modified",
    },
  },
  filesystem = {
    follow_current_file = true,
    group_empty_dirs = false,
    -- hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
        -- disable fuzzy finder
        ["/"] = "noop"
      }
    },
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
    },
  },
})
