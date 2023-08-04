local everblush = require('everblush')

local background = '#0c1418';

local search = {
    fg = '#dadada',
    bg = '#1e333d'
}

local lineNr = '#232a2d';
local cursorLineNr = '#c9c9c9';
local statusLineNC = '#1e333d';

everblush.setup({
    transparent_background = false,

    override = {
        ColorColumn = { bg = background },
        Conceal = { bg = background },
        CursorColumn = { bg = background },
        CursorLineNr = { fg = cursorLineNr, bg = background },
        DiffAdd = { bg = background },
        DiffChange = { bg = background },
        DiffDelete = { bg = background },
        DiffText = { bg = background },
        EndOfBuffer = { fg = background },
        Error = { bg = background },
        ErrorMsg = { bg = background },
        FoldColumn = { bg = background },
        Folded = { bg = background },
        Ignore = { bg = background },
        IncSearch = search,
        LineNr = { fg = lineNr, bg = background },
        MatchParen = { bg = background },
        ModeMsg = { bg = background },
        MsgArea = { bg = background },
        MsgSeparator = { bg = background },
        Normal = { bg = background },
        NormalFloat = { bg = background },
        NormalNC = { bg = background },
        Pmenu = { bg = background },
        PmenuSbar = { bg = background },
        PmenuSel = { fg = background },
        Search = search,
        SignColumn = { fg = background, bg = background },
        StatusLine = { bg = background },
        StatusLineNC = { bg = statusLineNC },
        TabLine = { bg = background },
        TabLineFill = { bg = background },
        TabLineSel = { bg = background },
        Todo = { bg = background },
        VertSplit = { fg = background },
        VisualNOS = { bg = background },
        WarningMsg = { bg = background },
        BufferLineFill = { fg = background, bg = background },
        LspFloatWinBorder = { fg = background },
        LspFloatWinNormal = { bg = background },
        NeogitDiffAddHighlight = { bg = background },
        NeogitDiffContextHighlight = { bg = background },
        NeogitDiffDeleteHighlight = { bg = background },
        NeogitHunkHeader = { bg = background },
        CmpDocumentationBorder = { bg = background },
        CmpItemAbbr = { bg = background },
        CmpItemAbbrDeprecated = { bg = background },
        CmpItemAbbrMatch = { bg = background },
        CmpItemAbbrMatchFuzzy = { bg = background },
        CmpItemKind = { bg = background },
        CmpItemMenu = { bg = background },
        NvimTreeFolderIcon = { bg = background },
        NvimTreeNormal = { bg =  background },
        NvimTreeNormalNC = { bg = background },
        NvimTreeStatusLineNC = { bg = background, fg = background },
        TelescopeBorder = { bg = background },
        TelescopeNormal = { bg = background },
        TelescopeSelection = { fg = '#dadada', bg = '#1e333d' },
        LspTroubleNormal = { bg = background },
    }
})

vim.opt.background = 'dark'
vim.cmd('colorscheme everblush')
