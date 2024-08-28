local wk = require("which-key");
wk.setup({
  notify = false
})

local execWithRoot = require("findRoot").execWithRoot

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>j", "<cmd>Portal jumplist backward<cr>")

vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

vim.cmd([[
  cnoreabbrev <expr> gr  (getcmdtype() ==# ':' && getcmdline() ==# 'gr')  ? 'Gr' : 'gr'
]])
vim.api.nvim_create_user_command(
  'Gr',
  function(opts)
    require('grug-far').grug_far({
      prefills = {
        search = opts.fargs[1],
        filesFilter = opts.fargs[2]
      }
    })
  end,
  { nargs = '*' }
)
-- leader
wk.register({
-- ["*"] = { 'viw<cmd>lua require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })<CR>', "Search with grug-far" },
["*"] = { 'viw<cmd>execute "Grep" shellescape(expand("<cword>"))<CR>', "Search with grug-far" },
a = { '<cmd>AerialToggle!<CR>', "Toggle Aerial" },
e = { execWithRoot('cd ${MONOREPO_ROOT} | Files'), "find file in monorepo" },
g = {
  name = "Git",
  b = { "<cmd>Git blame<CR>", "Blame" },
  s = { "<cmd>Git<CR>", "Status" },
  h = { "<cmd>DiffviewFileHistory<CR>", "History" },
  f = { "<cmd>DiffviewFileHistory %<CR>", "History of current file" },
  d = { "<cmd>DiffviewOpen<CR>", "Diff" },
  v = { "<cmd>call git#git_diffview_commit()<CR>", "Diff of commit" },
  dh = { "<cmd>diffget //2<CR>", "Diff get left" },
  dl = { "<cmd>diffget //3<CR>", "Diff get right" },
  e = { "<cmd>Gedit<CR>", "Edit" },
  l = { "<cmd>0Gclog!<CR>", "Log" },
  c = { "<cmd>Git commit<CR>", "Commit" },
  w = { "<cmd>Git write<CR>", "Write" },
  p = {
    name = 'Publish',
    f = { "<cmd>Git push --force-with-lease<CR>", "Push force" },
    b = { "<cmd>Git pub <CR>", "Publish branch" },
  },
  -- gr = { function() vim.cmd("!gh pr view -w<CR>") end ,  "View PR on this branch" },
  r = { "<cmd>!gh pr view -w<CR>",  "View PR on this branch" },
},
o = {
  name = "Package",
  u = {function() 
        if vim.bo.filetype == 'neo-tree' then
          local state = require("neo-tree.sources.manager").get_state("filesystem")
          local node = state.tree:get_node()
          vim.pretty_print(node)
          if node.type == 'file' then
          else 
            vim.cmd(":Files " .. node.path)
          end
        end
      end, "find files in current directory"},
  p = { execWithRoot('edit ${PACKAGE_ROOT}/package.json'), "Edit package.json" },
  t = { execWithRoot('edit ${PACKAGE_ROOT}/tsconfig.json'), "Edit tsconfig.json" },
  n = { execWithRoot('edit ${PACKAGE_ROOT}/node_modules'), "Edit node_modules" },
  s = { execWithRoot('cd ${PACKAGE_ROOT} | pwd'), "Set cwd to package root" },
  x = { execWithRoot('call ExecutePackageScript("${PACKAGE_ROOT}")'), "Execute package script" },
  e = { execWithRoot('cd ${PACKAGE_ROOT} | Files'), "find file in package" },
  o = {
    name = "Monorepo",
    p = { execWithRoot('edit ${MONOREPO_ROOT}/package.json'), "Edit package.json" },
    t = { execWithRoot('edit ${MONOREPO_ROOT}/tsconfig.json'), "Edit tsconfig.json" },
    n = { execWithRoot('edit ${MONOREPO_ROOT}/node_modules'), "Edit node_modules" },
    s = { execWithRoot('cd ${MONOREPO_ROOT} | pwd'), "Set cwd to monorepo root" },
    x = { execWithRoot('call ExecutePackageScript("${MONOREPO_ROOT}")'), "Execute package script" },
    e = { execWithRoot('cd ${MONOREPO_ROOT} | Files'), "find file in monorepo" },
  }
  },
v = {
  name = "System config editing",
  s = {":so $MYVIMRC<cr>", "Source vimrc"},
  o = {":vsp $MYVIMRC<cr>", "Open vimrc in vertical split"},
  e = {":vsp ~/.vim/vimrc<cr>", "Edit ~/.vim/vimrc in vertical split"},
  n = {":CocCommand snippets.editSnippets<cr>", "Edit snippets"},
  d = {":vsp ~/dotfiles/<cr>", "Open ~/dotfiles/ in vertical split"},
  i = {":PlugInstall<cr>", "Run PlugInstall"},
  j = {":e ~/.config/txs/sessions.json<cr>", "Edit sessions.json"},
},
n = {
  name = "Obsidian",
  n = { "<cmd>ObsidianNew<CR>", "New note" },
  s = { "<cmd>ObsidianSearch<CR>", "Search" },
  t = { "<cmd>ObsidianToday<CR>", "Today" },
}

}, { prefix="<leader>" })

require("legendary").setup({
  extentions = {
    which_key = {
      auto_register = true,
      do_bindings = false,
    }
  }
})

