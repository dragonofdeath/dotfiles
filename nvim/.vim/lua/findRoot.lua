-- function removeOilPrefix(inputString)
--     -- Remove 'oil://' from the start of the string if it exists
--     local result = string.gsub(inputString, "^oil://", "")
--     return result
-- end

function getCurrentPath() 
    local filetype = vim.bo.filetype
    if (filetype == "oil") then
        return require("oil").get_current_dir()
    end
    return vim.fn.expand("%:p")
end

function forPackage()
    local path = getCurrentPath()
    local result =  vim.fn.system("find-package-root " .. path)
    if (vim.v.shell_error ~= 0) then
        return vim.fn.getcwd()
    else
        return result
    end
end

function forMonorepo()
    local path = getCurrentPath()
    local result =  vim.fn.system("find-monorepo-root " .. path)
    if (vim.v.shell_error ~= 0) then
        return vim.fn.getcwd()
    else
        return result
    end
end

-- takes a command with placeholders like 'edit ${PACKAGE_ROOT}/package.json'
-- and returns a function that will execute the command with the path placeholders filled
function execWithRoot(cmd)
    return function()
        local result = cmd
        if (string.find(cmd, "%${PACKAGE_ROOT}") ~= nil) then
            local root = forPackage()
            result = string.gsub(result, "%${PACKAGE_ROOT}", root)
        end
        if (string.find(cmd, "%${MONOREPO_ROOT}") ~= nil) then
            local root = forMonorepo()
            result = string.gsub(result, "%${MONOREPO_ROOT}", root)
        end
        return vim.cmd(result)
    end
end


return {
    execWithRoot = execWithRoot,
    forPackage = forPackage,
    forMonorepo = forMonorepo,
    getCurrentPath = getCurrentPath
}
