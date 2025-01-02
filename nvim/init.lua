-- vim settings --

vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.title = true
vim.o.number = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.mapleader = ","

vim.keymap.set("", "<leader>l", ":set list!<CR>:set list?<CR>")
vim.keymap.set("", "<leader>n", ":set number!<CR>:set number?<CR>")
vim.keymap.set("", "<leader>p", ":set paste!<CR>:set paste?<CR>")

-- clear current search pattern
vim.keymap.set("", "<leader>s", ":let @/=''")

-- move through buffers
vim.keymap.set("n", "<C-h>", ":bp<CR>")
vim.keymap.set("n", "<C-l>", ":bn<CR>")

-- plugins --

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'Mofiqul/vscode.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('vscode').setup()
            require('vscode').load()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            theme = 'vscode'
        }
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end
    },
    {'nvim-treesitter/nvim-treesitter'},
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        -- keys = {
        --     {"n", "<leader>/", ":Neotree toggle current reveal_force_cwd<cr>"}
        -- }
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup()
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }
}

local opts = {
    checker = {
        enabled = true
    }
}

require("lazy").setup(plugins, opts)
