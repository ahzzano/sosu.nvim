-- A test has four components
-- File Name
-- Test No.
-- Input
-- Expected Output
tests = {
    {
        fname = 'graph.cpp',
        input = '2',
        output = 'YES\n'
    }
}

timeouts = {

}

-- Create a test
--- @type string[]
--- @param fname string Filename
--- @param input stirng[]? Inputs
--- @param output string[] Expected Outputs
local function create_test(fname, input, output)
    for key, value in pairs(output) do
        output[key] = value .. "\n"
    end
    local testcase = {
        fname = fname,
        input = table.concat(input, "\n"),
        output = table.concat(output, "\n"),
    }

    table.insert(tests, testcase)
end


local contest_group = vim.api.nvim_create_augroup('ContestGroup', { clear = true })

vim.api.nvim_create_user_command("ContestCompile", function(opts)
    local fname = vim.api.nvim_buf_get_name(0)
    local ft = vim.bo[0].ft

    if ft == "cpp" then
        local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

        vim.system({ 'g++', lfname, '-Wall', '-O3', '-std=c++20' }, { text = true }, function(out)
            vim.schedule(function()
                if out.stderr == "" then
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
                vim.bo[buf].modifiable = false

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

vim.api.nvim_create_user_command('ContestSetTimeout', function(opts)
    local fname = vim.api.nvim_buf_get_name(0)
    local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

    local args = opts.fargs
    local to = tonumber(args[1])
    timeouts[lfname] = to
end, { nargs = 1 })

vim.api.nvim_create_user_command("ContestAddTest", function()
    -- Get the local filename
    local fname = vim.api.nvim_buf_get_name(0)
    local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

    local inbuf = vim.api.nvim_create_buf(true, true)
    local outbuf = vim.api.nvim_create_buf(true, true)

    local win_in = vim.api.nvim_open_win(inbuf, false, {
        split = 'right',
        win = 0
    })

    local win_out = vim.api.nvim_open_win(outbuf, false, {
        split = 'below',
        win = win_in
    })


    vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
        group = contest_group,
        callback = function(ev)
            local inputs = vim.api.nvim_buf_get_lines(inbuf, 0, -1, false)
            local outputs = vim.api.nvim_buf_get_lines(outbuf, 0, -1, false)

            if ev.buf == inbuf then
                vim.api.nvim_win_close(win_in, true)
                vim.api.nvim_win_close(win_out, true)
            end

            if ev.buf == outbuf then
                vim.api.nvim_win_close(win_in, true)
                vim.api.nvim_win_close(win_out, true)
            end

            create_test(lfname, inputs, outputs)

            vim.print(tests)
            vim.api.nvim_clear_autocmds({ group = contest_group })
        end,
    })
end, {})

vim.api.nvim_create_user_command("ContestRun", function()
    local to_run = {}

    local fname = vim.api.nvim_buf_get_name(0)
    local ft = vim.bo[0].ft
    local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

    for index, value in ipairs(tests) do
        if value.fname == lfname then
            table.insert(to_run, value)
        end
    end

    local output_buffer = vim.api.nvim_create_buf(true, true)
    local win_buffer = vim.api.nvim_open_win(output_buffer, true, {
        split = 'right'
    })

    for index, value in ipairs(to_run) do
        local str = string.format("Running #%i", index)
        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index - 1, true, { str })
        local timeout = 1000
        if timeouts[lfname] then
            timeout = timeouts[lfname]
        end

        vim.system({ './a.out' }, { stdin = value.input, text = true, timeout = lfname }, function(out)
            vim.schedule(function()
                if out.signal == 15 then
                    vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true, { "TIMED OUT" })
                    return
                end
                if out.stdout ~= nil then
                    if value.output == out.stdout then
                        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true, { "CORRECT" })
                    else
                        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                            { "WRONG - " ..
                            'Expected: ' ..
                            string.gsub(value.output, "\n", ", ") .. " Found: " .. string.gsub(out.stdout, "\n", ", ") })
                    end
                else
                    vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                        { "WRONG - " .. "No Input Found - " .. 'Expected: ' .. value.output })
                end

                vim.bo[output_buffer].modifiable = false
            end)
        end)
    end
end, {})

vim.api.nvim_create_user_command("ContestRemoveTest", function()

end, {})
