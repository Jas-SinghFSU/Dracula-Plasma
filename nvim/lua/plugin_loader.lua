local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require('remap')
require('set')

require('lazy').setup({ {
    'maxmx03/dracula.nvim',
    config = function()
        require("dracula").setup {
            plugins = {
                ["todo-comments.nvim"] = false,
                ["indent-blankline.nvim"] = false
            }
        }
    end
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        local builtin = require('telescope.builtin')
        local tele = require('telescope')

        tele.setup({
            "node_modules/.*",
            "yarn.lock",
            "package%-lock.json",
            "lazy-lock.json",
            "target/.*",
            ".git/.*",
            ".*/package%-lock.json",
        })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > ")
            });
        end)
    end
}, {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
                javascriptreact = { { "prettierd", "prettier" } },
            },
            log_level = vim.log.levels.DEBUG
        })
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
},{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- vim.g.mkdp_browser = '/usr/share/applications/microsoft-edge.desktop'
  end,
  ft = { "markdown" },
},
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false
                }
            }
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' -- optional
        },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true

            -- empty setup using defaults
            require("nvim-tree").setup()
        end
    }, {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set('n', '<leader>a', mark.add_file)
        vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

        vim.keymap.set('n', '<leader>1', function()
            ui.nav_file(1)
        end)
        vim.keymap.set('n', '<leader>2', function()
            ui.nav_file(2)
        end)
        vim.keymap.set('n', '<leader>3', function()
            ui.nav_file(3)
        end)
        vim.keymap.set('n', '<leader>4', function()
            ui.nav_file(4)
        end)
        vim.keymap.set('n', '<leader>5', function()
            ui.nav_file(5)
        end)
    end
}, {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
},     --
    -- LSP Zero conf
    --
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(_, bufnr)
                local opts = {
                    buffer = bufnr,
                    remap = false
                }

                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end)

            -- to learn how to use mason.nvim with lsp-zero
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer' },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end
                }
            })

            local cmp = require('cmp')
            local cmp_select = {
                behavior = cmp.SelectBehavior.Select
            }

            -- this is the function that loads the extra snippets to luasnip
            -- from rafamadriz/friendly-snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                sources = { {
                    name = 'path'
                }, {
                    name = 'nvim_lsp'
                }, {
                    name = 'nvim_lua'
                }, {
                    name = 'luasnip',
                    keyword_length = 2
                }, {
                    name = 'buffer',
                    keyword_length = 3
                } },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<S-CR>'] = cmp.mapping.confirm({
                        select = true
                    })
                    -- ['<C-Space>'] = cmp.mapping.complete(),
                })
            })
        end
    }, {
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()
    end
}, {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require('mason-lspconfig').setup()
    end
},
    --
    -- END OF LSP Zero conf
    --
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require 'lsp_signature'.setup({
                on_attach = function(client, bufnr)
                    require "lsp_signature".on_attach({
                        bind = true, -- This is mandatory, otherwise border config won't get registered.
                        handler_opts = {
                            border = "rounded"
                        }
                    }, bufnr)
                end
            })
        end
    }, {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        opt = true,
        config = function()
            local git_blame = require('gitblame')

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = {
                        left = '',
                        right = ''
                    },
                    section_separators = {
                        left = '',
                        right = ''
                    },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {}
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {},
                    lualine_x = { {
                        git_blame.get_current_blame_text,
                        cond = git_blame.is_blame_text_available,
                        draw_empty = false,
                        separator = {
                            right = '',
                            left = ''
                        },
                        color = {
                            fg = '#282A36',
                            bg = '#8BE9FD'
                        }
                    } },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}, {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {}
    end
}, {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("ibl").setup({
            indent = {
                char = '▏'
            },
            exclude = { filetypes = { "dashboard" } }
        })
    end
}, {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require 'colorizer'.setup()
    end
}, {
    'f-person/git-blame.nvim',
    config = function()
        require('gitblame').setup {
            -- Note how the `gitblame_` prefix is omitted in `setup`
            enabled = true
        }
        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_message_template = '<author> • <date>'
        vim.g.gitblame_date_format = '%b %d, %Y at %I:%M %p'
        vim.g.gitblame_delay = 100
    end
}, {
    "akinsho/toggleterm.nvim",
    config = function()
        -- Calculate center window position
        local function center_win(width, height)
            -- Get the dimensions of the Neovim window
            local vim_width = vim.api.nvim_get_option("columns")
            local vim_height = vim.api.nvim_get_option("lines")

            -- Calculate the position to center the floating window
            local row = math.ceil((vim_height - height) / 2)
            local col = math.ceil((vim_width - width) / 2)

            return {
                relative = "editor",
                row = row,
                col = col,
                width = width,
                height = height
            }
        end

        require("toggleterm").setup {
            shade_terminals = false,
            open_mapping = '<A-t>',
            shell = vim.o.shell,
            direction = 'float',
            float_opts = {
                border = 'single',
                width = math.floor(vim.o.columns * 0.8),     -- 80% width
                height = math.floor(vim.o.lines * 0.6),      -- 60% height
                winblend = 0,                                -- Transparency level
                highlights = {
                    border = "Normal"
                }
            },
            size = function(term)
                return center_win(term.float_opts.width, term.float_opts.height)
            end
        }
    end
}, {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {}
    end
}, {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}, {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = {
                    icon = " ",
                    color = "info"
                },
                HACK = {
                    icon = " ",
                    color = "warning"
                },
                WARN = {
                    icon = " ",
                    color = "warning",
                    alt = { "WARNING", "XXX" }
                },
                PERF = {
                    icon = " ",
                    alt = { "" }
                },
                NOTE = {
                    icon = " ",
                    color = "#50fa7b",
                    alt = { "" }
                },
                TEST = {
                    icon = "⏲ ",
                    color = "#FF79c6",
                    alt = { "" }
                }
            },
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#FF5555" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FFB86C" },
                info = { "DiagnosticInfo", "#8BE9FD" },
                hint = { "DiagnosticHint", "#50FA7B" },
                default = { "Identifier", "#BD93F9" },
                test = { "Identifier", "#FF79C6" }
            }
        })
    end
}, {
    'kevinhwang91/nvim-ufo',
    dependencies = { {
        'kevinhwang91/promise-async'
    },
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup(
                    {
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                            { text = { "%s" },                  click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
                        }
                    }
                )
            end

        } },
    config = function()
        vim.o.foldcolumn = '1'     -- '0' is not bad
        vim.o.foldlevel = 99       -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'lsp', 'indent' }
            end
        })
    end
}, {
    'anuvyklack/pretty-fold.nvim',
    config = function()
        require('pretty-fold').setup {
            keep_indentation = false,
            fill_char = '•',
            sections = {
                left = { '+', function()
                    return string.rep('-', vim.v.foldlevel)
                end, ' ', 'number_of_folded_lines', ':', 'content' }
            }
        }
    end
}, {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- config here
    end
}, {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
        }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}, {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim',     -- required by telescope
        'MunifTanjim/nui.nvim',                                                    -- optional
        'nvim-treesitter/nvim-treesitter', 'rcarriga/nvim-notify',
        'nvim-tree/nvim-web-devicons'                                              -- previously nvim-tree/nvim-web-devicons
    },
    config = function()
        require('leetcode').setup {
            lang = 'javascript'
        }
    end
}, {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup {}
    end
} })

function ColorMeUp(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)
end

ColorMeUp()
vim.cmd('highlight FoldColumn  guibg=#282A36 guifg=#6272A4 ')

LS = require('luasnip')
CONFORM = require('conform')

vim.treesitter.query.set("javascript", "injections", "")
vim.treesitter.query.set("typescript", "injections", "")
vim.treesitter.query.set("lua", "injections", "")
