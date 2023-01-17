local feline = require('feline')

local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
    active = {},
    inactive = {},
}

components.active[1] = {
    {
        provider = '▊ ',
        hl = {
            fg = 'oceanblue',
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
                type = 'relative',
            }
        },
        hl = {
            fg = 'white',
            bg = 'oceanblue',
            style = 'bold',
        },
        left_sep = {
            { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
        },
        right_sep = {
            { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
        },
        priority = -1
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
                    fg = 'skyblue',
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
                    fg = 'skyblue',
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
                    fg = 'skyblue',
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
                    fg = 'skyblue',
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
        hl = { fg = 'skyblue' },
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
            fg = 'skyblue',
            style = 'bold',
        },
    },
}

components.inactive[1] = {
    {
        provider = 'file_type',
        hl = {
            fg = 'white',
            bg = 'oceanblue',
            style = 'bold',
        },
        left_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'oceanblue',
            },
        },
        right_sep = {
            {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'oceanblue',
                },
            },
            'slant_right',
        },
    },
    -- Empty component to fix the highlight till the end of the statusline
    {},
}

feline.setup({components = components})
