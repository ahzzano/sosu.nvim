local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
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

ls.add_snippets("cpp", {
    -- competitive programming hacks
    s('syncoff', {
        t({ "std::ios_base::sync_with_stdio(false);", "std::cin.tie(NULL);" }),
    }),

    s('cpnext', fmt([[
    int next() {{
        int a;
        std::cin >> a;
        return a;
    }}
    ]], {})),

    s('cpncases',
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

    s('rtyp', {
        d(1, retype)
    }),

    s('cpst', fmt([[
    #include <iostream>
    #include <vector>

    typedef std::vector<int> vec_i;
    typedef std::pair<int, int> ipair;

    int main() {{
        {}
    }}
    ]], {
        i(0)
    }))

})
