-- # Which Key
local wk = lvim.builtin.which_key

wk.setup.plugins.presets.text_objects = true

wk.opts = {
    mode = "n", -- NORMAL mode
    prefix = "<space>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
wk.vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<space>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- ## Defaults
-- lvim.builtin.which_key.mappings["f"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" }
wk.mappings["f"] = { require("lvim.lsp.utils").format, "Format" }
wk.mappings["D"] = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" }


-- -- ## Persistence
-- -- restore the session for the current directory
-- wk.mappings["S"] = {
--     name = "Session",
--     c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
--     l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
--     Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
-- }

-- ## SymbolsOutline
wk.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "Outline" }

-- ## Project Files
wk.mappings["F"] = {
    require("lvim.core.telescope.custom-finders").find_project_files, "Find File"
}

-- ## Helps
wk.mappings["h"] = { "<cmd>Telescope help_tags<cr>", "Help" }
