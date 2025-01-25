local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    -- competitive programming hacks
    s('syncoff', {
        t({ "std::ios_base::sync_with_stdio(false);", "std::cin.tie(NULL);" }),
    }),

    s('ncases', 
        fmt(
        [[
        int {} = 0;
        std::cin >> {};
        for(int {}=0; {}<{}; {}++) {{
            {}

        }}
        ]], {
            i(1, "N"), rep(1), i(2), rep(2), rep(1), rep(2), i(0)
        })
    ),

    s('allv',
        fmt(
        [[
        {}.begin(), {}.end()
        ]], {
            i(1, 'v'),
            rep(1),
        })
    ), 

})


