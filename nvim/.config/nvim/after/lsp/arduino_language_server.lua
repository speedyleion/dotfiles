local function get_fqbn(root_dir)
    local default_fqbn = "arduino:avr:uno"
    if not root_dir then
        return default_fqbn
    end

    local sketch_yaml = root_dir .. "/sketch.yaml"
    local file = io.open(sketch_yaml, "r")
    if not file then
        return default_fqbn
    end

    local content = file:read("*a")
    file:close()

    return content:match("fqbn:%s*([%w:_%-]+)") or default_fqbn
end

return {
    cmd = function(dispatchers, config)
        local cmd = {
            "arduino-language-server",
            "-cli-config",
            vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
            "-fqbn",
            get_fqbn(config.root_dir),
        }
        return vim.lsp.rpc.start(cmd, dispatchers, {
            cwd = config.root_dir,
        })
    end,
    filetypes = { 'arduino', 'cpp', 'c' },
    root_markers = { '*.ino', 'sketch.yaml' },
    reuse_client = function(client, config)
        return client.name == "arduino_language_server"
    end,
}
