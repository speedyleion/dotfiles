return {
    -- lsp sets a formatexpr that doesn't work for protols, so clear it on attach.
    on_attach = function(_, bufnr)
        vim.bo[bufnr].formatexpr = ''
    end,
}
