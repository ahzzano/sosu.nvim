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

ls.add_snippets("cpp", {
    -- competitive programming hacks
    s('syncoff', {
        t({ "std::ios_base::sync_with_stdio(false);", "std::cin.tie(NULL);" }),
    }),

    s('ncases',
        fmt([[
        int {} = 0;
        std::cin >> {};
        {}
        ]], {
            i(1, "N"), rep(1), i(0)
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

    s('rtyp', {
        d(1, retype)
    }),

    s('foru', fmt([[
    for(int {} = 0; {} < {}; {}++) {{
        {}
    }}

    ]], {
        i(1, "i"),
        rep(1),
        i(2),
        rep(1),
        i(0)
    })),

    s('ford', fmt([[
    for(int {}={}, {} >= 0; {}--) {{
        {}
    }}

    ]], {
        i(1, "i"),
        i(2),
        rep(1),
        rep(1),
        i(0),
    })),

    s('vv', fmt("std::vector<{}> {};{}", { i(1, "int"), i(2, "vec"), i(0) })),

    s('lambda', fmt([[
    [{}]({}){{
        {}
    }}
    ]], {
        i(1),
        i(2),
        i(0),
    })),

    s('print', fmt([[std::cout << {} << {};]], {
        i(1),
        c(2, {
            t("\" \""),
            t("\"\\n\""),
        })
    })),

    s('nxtin', fmt([[
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

    typedef std::vector<int> vec_i;
    typedef std::pair<int, int> ipair;

    int main() {{
        {}
    }}
    ]], {
        i(0)
    }))

})
