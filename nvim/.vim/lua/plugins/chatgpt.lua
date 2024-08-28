require("chatgpt").setup({
  openai_params = {
    model = "gpt-4",
    max_tokens = 2000,
  },
  edit_with_instructions = { 
     diff = true, 
     keymaps = { 
       close = "<C-c>", 
       accept = "<C-y>", 
       toggle_diff = "<C-d>", 
       toggle_settings = "<C-o>", 
       toggle_help = "<C-h>", 
       cycle_windows = "<Tab>", 
       use_output_as_input = "<C-i>", 
     }, 
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

