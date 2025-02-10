-- A test has four components
-- File Name
-- Test No.
-- Input
-- Expected Output
tests = {
    {
        fname = 'graph.cpp',
        input = { '2', '3' },
        output = { 'YES', 'PLS' }
    },
    {
        fname = 'graph.cpp',
        input = { '2', '3' },
        output = { 'NO', 'PLS' }
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
    for index, value in ipairs(output) do
        if output[index] == '' then
            table.remove(output, index)
        end
    end
    local testcase = {
        fname = fname,
        input = input,
        output = output
    }

    table.insert(tests, testcase)
end

--- @param lfname string
local function compile_cpp(lfname)
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
end


local contest_group = vim.api.nvim_create_augroup('ContestGroup', { clear = true })

vim.api.nvim_create_user_command("ContestCompile", function(opts)
    local fname = vim.api.nvim_buf_get_name(0)
    local ft = vim.bo[0].ft
    local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

    if ft == "cpp" then
        compile_cpp(lfname)
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

    local function cb(ev)
        if ev.buf == inbuf or ev.buf == outbuf then
            vim.api.nvim_win_close(win_in, true)
            vim.api.nvim_win_close(win_out, true)

            local inputs = vim.api.nvim_buf_get_lines(inbuf, 0, -1, false)
            local outputs = vim.api.nvim_buf_get_lines(outbuf, 0, -1, false)

            create_test(lfname, inputs, outputs)


            vim.api.nvim_clear_autocmds({ group = contest_group })
            print('Successfully added your test')
        end
    end

    local function close_t()
        vim.api.nvim_win_close(win_in, true)

        local inputs = vim.api.nvim_buf_get_lines(inbuf, 0, -1, false)
        local outputs = vim.api.nvim_buf_get_lines(outbuf, 0, -1, false)

        create_test(lfname, inputs, outputs)

        vim.api.nvim_clear_autocmds({ group = contest_group })
        print('Successfully added your test')
    end

    vim.keymap.set('n', 'q', close_t, { buffer = inbuf })
    vim.keymap.set('n', 'q', close_t, { buffer = outbuf })

    vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
        group = contest_group,
        buffer = inbuf,
        callback = cb
    })

    vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
        group = contest_group,
        buffer = outbuf,
        callback = cb
    })
end, {})

vim.api.nvim_create_user_command("ContestRun", function(opts)
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
        local test_string = "[Test #" .. index .. "] "

        local str = string.format("%s RUNNING", test_string)
        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index - 1, true, { str })
        local timeout = 1000

        if timeouts[lfname] then
            timeout = timeouts[lfname]
        end

        local executable = { './a.out' }

        -- check filetypes
        if ft == 'cpp' then
            compile_cpp(lfname)
            executable = { './a.out' }
            if vim.fn.exists('g:os') then
                local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
                if is_windows then
                    executable = { 'a.exe' }
                end
            end
        elseif ft == 'python' then
            executable = { 'python', lfname }
        else
            vim.print('Invalid FT. Not running')
            return
        end

        vim.system(executable, { stdin = value.input, text = true, timeout = timeout }, function(out)
            vim.schedule(function()
                if out.signal == 15 then
                    vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                        { test_string .. "TIMED OUT" })
                    return
                end
                if out.stdout ~= nil then
                    local outputs = {}
                    for s in string.gmatch(out.stdout, '[^\n]+') do
                        table.insert(outputs, s)
                    end

                    local correct = true

                    if #outputs ~= #value.output then
                        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                            { test_string .. "WRONG - " .. "Invalid number of inputs found" })
                        correct = false
                    end

                    for i = 1, #outputs do
                        if not correct then
                            break
                        end
                        local a = string.gsub(value.output[i], "\n", "")
                        local b = string.gsub(outputs[i], "\n", "")
                        if a ~= b then
                            local line_string = "Line: " .. i
                            vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                                { test_string .. "WRONG - " ..
                                line_string .. ' Expected: ' ..
                                string.gsub(value.output[i], "\n", "") ..
                                " Found: " .. string.gsub(outputs[i], "\n", "") })
                            correct = false
                            break
                        end
                    end

                    if correct then
                        vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true, { test_string .. "CORRECT" })
                    end
                else
                    vim.api.nvim_buf_set_lines(output_buffer, index - 1, index, true,
                        { test_string .. "WRONG - " .. "No Input Found - " .. 'Expected: ' .. value.output })
                end
            end)
        end)
    end
end, {})

local function display_testcase(buf, testcase)
    vim.bo[buf].modifiable = true

    local map = {
        '==MAPPINGS==',
        '<l> - Next Testcase',
        '<h> - Previous Testcase',
        '<D> - Delete Testcase',
        '<q> - Leave ',
        '',
    }
    local inputs = { '======INPUTS======', unpack(testcase.input) }
    table.insert(inputs, '===================')
    table.insert(inputs, '')
    local outputs = { '======OUTPUTS======', unpack(testcase.output) }
    table.insert(outputs, '===================')
    table.insert(outputs, '')

    for index, value in ipairs(inputs) do
        table.insert(map, value)
    end

    for index, value in ipairs(outputs) do
        table.insert(map, value)
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, true, map)
    vim.bo[buf].modifiable = false
end

vim.api.nvim_create_user_command("ContestView", function()
    local to_run = {}

    local fname = vim.api.nvim_buf_get_name(0)
    local lfname = string.gsub(fname, vim.fn.getcwd() .. "/", '')

    for index, value in ipairs(tests) do
        if value.fname == lfname then
            table.insert(to_run, { ind = index, case = value })
        end
    end

    local test_case_display = vim.api.nvim_create_buf(true, true)

    local ind = 1
    display_testcase(test_case_display, to_run[ind].case)

    local win_in = vim.api.nvim_open_win(test_case_display, false, {
        split = 'right',
        win = 0
    })

    vim.keymap.set('n', 'h', function()
        if ind - 1 <= 0 then
            ind = #to_run
        else
            ind = ind - 1
        end
        display_testcase(test_case_display, to_run[ind].case)
    end, { buffer = test_case_display })

    vim.keymap.set('n', 'l', function()
        if ind + 1 <= #to_run then
            ind = ind + 1
        else
            ind = 1
        end
        display_testcase(test_case_display, to_run[ind].case)
    end, { buffer = test_case_display })

    vim.keymap.set('n', 'D', function()
        vim.api.nvim_win_close(win_in, true)
        local dd = to_run[ind].ind
        table.remove(tests, dd)
        vim.print('Deleted that test case')
    end, { buffer = test_case_display })

    vim.keymap.set('n', 'q', function()
        vim.api.nvim_win_close(win_in, true)
    end, { buffer = test_case_display })
end, {})
