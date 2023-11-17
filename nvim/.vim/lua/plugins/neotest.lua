
require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "echo hello;",
      -- jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.system('find-package-root ' .. path)
      end,
    }),
  }
})

