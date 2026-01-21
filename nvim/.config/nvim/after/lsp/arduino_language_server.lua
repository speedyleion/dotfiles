  return {
    cmd = {
        "arduino-language-server",
        "-cli-config", 
        vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
        "-fqbn",
        "esp32:esp32:XIAO_ESP32C6"
    }
  }
