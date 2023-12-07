require("diffview").setup({
  hooks = {
    diff_buf_read = function(bufnr)
      -- Fix the coc-tsserver crashing in diffview
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local filetype = vim.bo[bufnr].filetype

      -- Check if buffer name starts with diffview://
      if string.find(bufname, "diffview://") then

        -- Check for TypeScript, JavaScript, or their React variants
        if string.find(filetype, "typescript") or string.find(filetype, "javascript") then
          vim.bo[bufnr].filetype = filetype .. "_nolsp"

          -- Start treesitter with appropriate language based on original filetype
          if string.find(filetype, "typescript") then
            vim.treesitter.start(bufnr, "typescript")
          elseif string.find(filetype, "javascript") then
            vim.treesitter.start(bufnr, "javascript")
          end
        end
      end
    end,
  }
})
