if vim.fn.executable('fdfind') == 1 then
    vim.env.FZF_DEFAULT_COMMAND='fdfind -H --type f'
elseif vim.fn.executable('fd') == 1 then
    vim.env.FZF_DEFAULT_COMMAND='fd -H --type f'
end

return {
    { "junegunn/fzf", config = function() vim.fn["fzf#install"]() end },
    { "junegunn/fzf.vim"}
}
