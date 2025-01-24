local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
    s("iferr", 
        fmt([[
            if {} != nil {{
                {}
            }}
        ]], {
            i(1, "err"),
            i(0)
        })
    ),
})

