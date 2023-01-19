local feline = require('feline')

local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
    active = {},
    inactive = {},
}

dark_orange = '#C75B13'

components.active[1] = {
    {
        provider = '▊ ',
        hl = {
            fg = dark_orange,
        },
    },
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = vi_mode_utils.get_mode_color(),
                style = 'bold',
            }
        end,
    },
    {
        provider = {
            name = 'file_info',
            opts = {
                colored_icon = false,
                type = 'relative',
            }
        },
        hl = {
            fg = 'white',
            bg = dark_orange,
            style = 'bold',
        },
        left_sep = {
            { str = ' ', hl = { bg = dark_orange, fg = 'NONE' } },
        },
        right_sep = {
            { str = ' ', hl = { bg = dark_orange, fg = 'NONE' } },
        },
        priority = -1
    },
    {
        provider = 'file_type',
        left_sep = {
            ' '
        },
        right_sep = {
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'orange',
                    bg = 'bg',
                },
            },
        },
    },
    {
        provider = 'file_size',
        left_sep = {
            ' '
        },
        right_sep = {
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'orange',
                    bg = 'bg',
                },
            },
        },
    },
    {
        provider = 'file_encoding',
        left_sep = ' ',
        right_sep = {
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'orange',
                    bg = 'bg',
                },
            },
        },
    },
    {
        provider = function(_, _)
            return vim.api.nvim_buf_get_option(0, 'fileformat')
        end,
        left_sep = ' ',
        right_sep = {
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'orange',
                    bg = 'bg',
                },
            },
        },
    },
    {
        provider = function(_, _)
            local r, c = unpack(vim.api.nvim_win_get_cursor(0))
            return r .. '/' .. vim.api.nvim_buf_line_count(0) .. ':' .. c .. '/' .. #vim.fn.getline('.')
        end,
        left_sep = ' ',
        right_sep = {
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'orange',
                    bg = 'bg',
                },
            },
            ' ',
        },
    },
    {
        provider = 'diagnostic_errors',
        hl = { fg = 'red' },
    },
    {
        provider = 'diagnostic_warnings',
        hl = { fg = 'yellow' },
    },
    {
        provider = 'diagnostic_hints',
        hl = { fg = 'cyan' },
    },
    {
        provider = 'diagnostic_info',
        hl = { fg = 'orange' },
    },
}

components.active[2] = {
    {
        provider = 'git_branch',
        hl = {
            fg = 'white',
            bg = 'black',
            style = 'bold',
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black',
            },
        },
    },
    {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
            bg = 'black',
        },
    },
    {
        provider = 'git_diff_changed',
        hl = {
            fg = 'orange',
            bg = 'black',
        },
    },
    {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
            bg = 'black',
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black',
            },
        },
    },
    {
        provider = 'line_percentage',
        hl = {
            style = 'bold',
        },
        left_sep = '  ',
        right_sep = ' ',
    },
    {
        provider = 'scroll_bar',
        hl = {
            fg = 'orange',
            style = 'bold',
        },
    },
}

components.inactive[1] = {
    {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            }
        },
        hl = {
            fg = 'white',
            bg = 'black',
        },
        left_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black',
            },
        },
        right_sep = {
            {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'black',
                },
            },
        }
    },
    -- Empty component to fix the highlight till the end of the statusline
    {},
}

feline.setup({components = components})
