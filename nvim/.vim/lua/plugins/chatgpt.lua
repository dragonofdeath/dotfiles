require("chatgpt").setup({
  openai_params = {
    model = "gpt-4",
    max_tokens = 2000,
  },
  keymaps = {
      close = { "<C-c>" },
      submit = "<S-CR>",
      yank_last = "<C-y>",
      yank_last_code = "<C-k>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      toggle_settings = "<C-o>",
      new_session = "<C-n>",
      cycle_windows = "<Tab>",
      -- in the Sessions pane
      select_session = "<Space>",
      rename_session = "r",
      delete_session = "d",
    },
})

