local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local snippets, autosnippets = {}, {}

local default_document = s(
    "initd",
    fmt([[
    \documentclass{{article}}
    \usepackage{{amsmath}}
    \usepackage{{graphicx}}
    \usepackage{{tikz}}

    \title{{{}}}
    \author{{{}}}
    \date{{{}}}

    \begin{{document}}

    \maketitle

    \section{{Introduction}}
    {}

    \end{{document}}
    ]], {
        i(1, "document title"),
        i(2, "author"),
        i(3, "date"),
        i(4, "")
    })
)

local numbered_equation = s(
    "equ",
    fmt([[
        \begin{{equation}}
            {}
        \end{{equation}}
    ]], {
        i(1, "")
    })
)

local unnumbered_equation = s(
    "eq",
    fmt([[
        \[
            {}
        \]
    ]], {
        i(1, "")
    })
)

local enumerate = s("li", fmt([[
    \begin{{enumerate}}
        \item {}
    \end{{enumerate}}
]], i(1, "")))

local list = s("ul", fmt([[
    \begin{{itemize}}
        \item {}
    \end{{itemize}}
]],
    i(1, "")))

local graphics = s("cg", fmt([[
    \begin{{figure}}[h]
        \centering
        \includegraphics{{{}}}
        \caption{{{}}}
    \end{{figure}}
]], {
    i(1, "filename"),
    i(2, "caption")
}))

table.insert(snippets, default_document)
table.insert(snippets, unnumbered_equation)
table.insert(snippets, list)
table.insert(snippets, enumerate)
table.insert(snippets, graphics)

return snippets, autosnippets
