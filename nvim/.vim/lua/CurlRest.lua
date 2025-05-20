-- Define the :CurlRels command
vim.api.nvim_create_user_command("CurlRest", function()
    -- Get the content of the unnamed register
    -- local curl_request = vim.fn.getreg('+')
    
    -- Check if curlconverter is installed
    local handle = io.popen("command -v curlconverter")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result == "" then
            vim.notify("curlconverter is not installed or not in PATH", vim.log.levels.ERROR)
            return
        end
    else
        vim.notify("Failed to check curlconverter installation", vim.log.levels.ERROR)
        return
    end
    
    local output_file = os.getenv('HOME') .."/http/" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".http"

    -- Run curlconverter and write to output file
    local cmd = string.format("pbpaste | curlconverter --language http - > %s", output_file)
    -- log cmd
    -- print(cmd)
    local result = os.execute(cmd)
    if result == 0 then
        -- open the output file in current buffer
        vim.cmd("edit " .. output_file)
    else
        vim.notify("Failed to execute curlconverter", vim.log.levels.ERROR)
    end
    
end, { nargs = 0 })
