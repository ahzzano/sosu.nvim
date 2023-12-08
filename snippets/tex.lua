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

local snippets = {}
local autosnippets = {}

local default_document = s(
    "inittex",
    fmt([[
    \documentclass{{article}}

    \usepackage{{amsmath}}
    \usepackage{{amssymb}}
    \usepackage{{amsthm}}
    \usepackage{{graphicx}}
    \usepackage{{tikz}}

    \title{{{title}}}
    \author{{{author}}}
    \date{{{date}}}

    \begin{{document}}

    \maketitle
    \section{{Introduction}}
    {content}

    \end{{document}}
    ]], {
        title = i(1, ""),
        author = i(2, ""),
        date = i(3, ""),
        content = i(4, "")
    })
)

local numbered_equation = s(
    "!eq",
    fmt([[
        \begin{{equation}}
            {equation}
            \label{{eq:{equation_label}}}
        \end{{equation}}
    ]], {
        equation_label = i(1, ""),
        equation = i(2, "")
    })
)

local unnumbered_equation = s(
    "!ueq",
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

local graphics = s("!ig", fmt([[
    \begin{{figure}}[h]
        \centering
        \includegraphics{{{file}}}
        \caption{{{caption}}}
    \end{{figure}}
]], {
    file = i(1, "filename"),
    caption = i(2, "")
}))

table.insert(snippets, list)
table.insert(snippets, enumerate)

table.insert(autosnippets, graphics)
table.insert(autosnippets, default_document)
table.insert(autosnippets, unnumbered_equation)
table.insert(autosnippets, numbered_equation)

return snippets, autosnippets
