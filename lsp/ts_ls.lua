return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "svelte",
        "vue"
    },
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath('data') ..
                    '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { "vue" }
            }
        }

    }
}
