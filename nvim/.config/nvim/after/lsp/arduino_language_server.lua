  return {
    cmd = {
        "arduino-language-server",
        "-cli-config", 
        vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
        "-fqbn",
        "arduino:avr:leonardo"
    }
  }
