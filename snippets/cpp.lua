local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local ts_utils = require("nvim-treesitter.ts_utils")

local function get_return_type()
    local node = ts_utils.get_node_at_cursor()

    if node == nil then
        return nil
    end

    local parent = node:parent()

    local query = vim.treesitter.query.parse('cpp', [[
        (function_definition type: (_) @func_type)
    ]])

    for id, _nodes in query:iter_captures(node:root(), 0) do
        local name = query.captures[id]
        if name == 'func_type' then
            local func_type = vim.treesitter.get_node_text(_nodes, 0)
            return func_type
        end
    end
end

local retype = function()
    local ret = get_return_type()

    if ret == nil then
        return ls.sn(nil, {})
    end

    return ls.sn(nil, { t(ret .. " "), i(1), t('=') })
end

local nxtinf = function(args, parent, user_args)
    return args[1][1]:gsub(",", ">>")
end

-- ls.add_snippets("cpp", {
--     -- competitive programming hacks
--     s('syncoff', {
--         t({ "std::ios_base::sync_with_stdio(false);", "std::cin.tie(NULL);", "" }),
--     }),
--
--     s('if', fmt([[
--     if({}) {{
--         {}
--     }}
--     ]], { i(1), i(0) })),
--
--     s('allv',
--         fmt(
--             [[
--         {}.begin(), {}.end()
--         ]], {
--                 i(1, 'v'),
--                 rep(1),
--             })
--     ),
--
--     s('rtyp', {
--         d(1, retype)
--     }),
--
--     s('foru', fmt([[
--     for({} {} = {}; {} < {}; {}++) {{
--         {}
--     }}
--
--     ]], {
--         i(1, "int"),
--         i(2, "i"),
--         i(3, "0"),
--         rep(2),
--         i(4),
--         rep(2),
--         i(0)
--     })),
--
--     s('ford', fmt([[
--     for({} {}={}; {} >= {}; {}--) {{
--         {}
--     }}
--
--     ]], {
--         i(1, "int"),
--         i(2, "i"),
--         i(3),
--         rep(2),
--         i(4),
--         rep(2),
--         i(0),
--     })),
--
--     s('fore', fmt([[
--     for({} {} : {}) {{
--         {}
--     }}
--     ]], {
--         i(1, "auto"),
--         i(2, "&var"),
--         i(3, "vec"),
--         i(0)
--     })),
--
--     s('vv', fmt("std::vector<{}> ", { i(1, "int") })),
--
--     s('lambda', fmt([[
--     [{}]({}){{
--         {}
--     }}
--     ]], {
--         i(1),
--         i(2),
--         i(0),
--     })),
--
--     s('print', fmt([[std::cout << {} << " ";
--     {}]], {
--         i(1), i(0)
--     })),
--
--     s('println', fmt([[std::cout << {} << "\n";
--     {}]], {
--         i(1), i(0)
--     })),
--
--     s('nextv', fmt([[
--     {} {};
--     std::cin >> {};
--     {}
--     ]], {
--         i(1, "int"),
--         i(2, "k"),
--         -- rep(2),
--         f(nxtinf, { 2 }),
--         i(0)
--     })),
--
--     s('cpst', fmt([[
--     #include <iostream>
--     #include <vector>
--
--     typedef long long int ll;
--     typedef unsigned long long int ull;
--
--     using namespace std;
--
--     int main() {{
--         {}
--     }}
--     ]], {
--         i(0)
--     })),
--
--     s('binpow', fmt([[
--     {} binpow({} a, {} b) {{
--         {} res = 1;
--         while(b > 0) {{
--             if(b & 1)
--                 res *= a;
--             a *- a;
--             b >>=1;
--         }}
--
--         return res;
--     }}
--     {}]], {
--         i(1, 'long long'),
--         rep(1),
--         rep(1),
--         rep(1),
--         i(0)
--     }))
--
-- })

return {
    -- competitive programming hacks
    s('syncoff', {
        t({ "std::ios_base::sync_with_stdio(false);", "std::cin.tie(NULL);", "" }),
    }),

    s('if', fmt([[
    if({}) {{
        {}
    }}
    ]], { i(1), i(0) })),

    s('allv',
        fmt(
            [[
        {}.begin(), {}.end()
        ]], {
                i(1, 'v'),
                rep(1),
            })
    ),

    s('rtyp', {
        d(1, retype)
    }),

    s('foru', fmt([[
    for({} {} = {}; {} < {}; {}++) {{
        {}
    }}

    ]], {
        i(1, "int"),
        i(2, "i"),
        i(3, "0"),
        rep(2),
        i(4),
        rep(2),
        i(0)
    })),

    s('ford', fmt([[
    for({} {}={}; {} >= {}; {}--) {{
        {}
    }}

    ]], {
        i(1, "int"),
        i(2, "i"),
        i(3),
        rep(2),
        i(4),
        rep(2),
        i(0),
    })),

    s('fore', fmt([[
    for({} {} : {}) {{
        {}
    }}
    ]], {
        i(1, "auto"),
        i(2, "&var"),
        i(3, "vec"),
        i(0)
    })),

    s('vv', fmt("std::vector<{}> ", { i(1, "int") })),

    s('lambda', fmt([[
    [{}]({}){{
        {}
    }}
    ]], {
        i(1),
        i(2),
        i(0),
    })),

    s('print', fmt([[std::cout << {} << " ";
    {}]], {
        i(1), i(0)
    })),

    s('println', fmt([[std::cout << {} << "\n";
    {}]], {
        i(1), i(0)
    })),

    s('nextv', fmt([[
    {} {};
    std::cin >> {};
    {}
    ]], {
        i(1, "int"),
        i(2, "k"),
        -- rep(2),
        f(nxtinf, { 2 }),
        i(0)
    })),

    s('cpst', fmt([[
    #include <iostream>
    #include <vector>

    typedef long long int ll;
    typedef unsigned long long int ull;

    using namespace std;

    int main() {{
        {}
    }}
    ]], {
        i(0)
    })),

    s('binpow', fmt([[
    {} binpow({} a, {} b) {{
        {} res = 1;
        while(b > 0) {{
            if(b & 1)
                res *= a;
            a *- a;
            b >>=1;
        }}

        return res;
    }}
    {}]], {
        i(1, 'long long'),
        rep(1),
        rep(1),
        rep(1),
        i(0)
    }))

}
