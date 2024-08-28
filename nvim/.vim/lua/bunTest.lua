function BunTest(options)
    -- Save the current buffer's file path
    local file_path = vim.fn.expand('%:p')
    local dir_path = vim.fn.fnamemodify(file_path, ':h')
    local file_name = vim.fn.fnamemodify(file_path, ':t')

    -- Create a new tab
    vim.cmd('tabnew')

    local only = options.only and ' --only' or ''
    -- Open a terminal in the new tab
    vim.cmd('terminal cd ' .. dir_path .. ' && bun test ' .. only .. ' ' .. file_name)

    -- Change the directory to the saved file's directory
    -- We use vim.api.nvim_feedkeys to send the command to the terminal.
    -- The 't' flag tells Neovim to not remap keys, ensuring the command is sent as is.
    -- local cd_command = 'cd ' .. dir_path .. '\n'
    -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cd_command, true, false, true), 't', false)
end

-- Register the function as a command for ease of use
vim.api.nvim_create_user_command('BunTest', function() 
    BunTest({})
end, {nargs = "*"})
vim.api.nvim_create_user_command('BunTestOnly', function() 
    BunTest({ only = true })
end, {nargs = "*"})
