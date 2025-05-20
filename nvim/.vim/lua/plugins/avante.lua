require('avante_lib').load()
require('avante').setup({
  -- provider = "openai",
  api_key_name="ANTHROPIC_API_KEY",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-7-sonnet-20250219",
    temperature = 0,
    max_tokens = 8192,
  },
  behaviour = {
    auto_suggestions = false,
  },
})
