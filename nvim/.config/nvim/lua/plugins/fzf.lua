if vim.fn.executable('fdfind') == 1 then
    vim.env.FZF_DEFAULT_COMMAND='fdfind --type f'
elseif vim.fn.executable('fd') == 1 then
    vim.env.FZF_DEFAULT_COMMAND='fd --type f'
end

return {
    { "junegunn/fzf", config = function() vim.fn["fzf#install"]() end },
    { "junegunn/fzf.vim"}
}
