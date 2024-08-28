local M = {}

function M.setup()
  vim.api.nvim_create_user_command(
    'TypeFile',
    function(opts)
      M.show_contents(opts.args)
    end,
    { nargs = '*' }
  )
end

function M.show_contents(file_path)
  -- Create or get an empty buffer
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_set_current_buf(buf)

  local ns_id = vim.api.nvim_create_namespace('typerelax');

  local contents = vim.fn.readfile(file_path)
  local contents_line_count = #contents

    -- Display each line of the file as virtual text at the end of the buffer
  for line_num, line in ipairs(contents) do
    vim.api.nvim_buf_set_lines(buf, line_num - 1, line_num, false, {""})

    vim.api.nvim_buf_set_extmark(buf, ns_id, line_num-1, 0, {
      virt_text = {{ line, "Comment" }},
      virt_text_pos = 'overlay', -- This can be 'right_align' or 'eol' as well
    })
  end
    -- -- Optionally, add a separator between files
    -- vim.api.nvim_buf_set_extmark(buf, 0, #contents, 0, {
    --   virt_text = {{ "-- End of " .. file_path .. " --", "NonText" }},
    -- })
  -- end
end

M.setup()
