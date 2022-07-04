-- # Core
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor50"
vim.opt.cmdheight = 1
-- tabs, spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4 -- how many columns (=spaces) the cursor moves right when you press <Tab>
-- folding
vim.opt.foldenable = false -- disable folding on open
vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- git diff
vim.opt.diffopt:append { "vertical" } -- internal, filler, closeoff, vertical

-- # LunarVim
lvim.log.level = "warn"
lvim.use_icons = true
lvim.transparent_window = false

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})

-- sometimes cmdheight messing up
vim.api.nvim_create_user_command(
    "CHeight",
    function()
        -- print(string.upper(opts.args))
        vim.opt.cmdheight = 1
    end,
    { force = true, nargs = 0 }
)
