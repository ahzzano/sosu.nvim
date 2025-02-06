local tests = {}

vim.api.nvim_create_user_command("ContestCompile", function(opts)
    local fname = vim.api.nvim_buf_get_name(0)
    local ft = vim.bo[0].ft

    if ft == "cpp" then
        local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

        vim.system({ 'g++', lfname, '-Wall', '-O3', '-std=c++20' }, { text = true }, function(out)
            vim.schedule(function()
                if out.stdout == "" or next(out.stderr) == "" then
                    print "Compiled Successfully!"
                    return
                end
                local buf = vim.api.nvim_create_buf(true, true)
                if out.stderr ~= nil then
                    local lines = {}
                    for line in string.gmatch(out.stderr, "( [^\n]*)\n") do
                        table.insert(lines, line)
                    end
                    vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
                end

                vim.api.nvim_open_win(buf, false, {
                    split = 'right',
                    win = 0
                })
            end)
        end)
    else
        print("Not a C++ File")
    end
end, {})
