require "lita"
require "api-ai-ruby"
Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/api_ai.rb"

Lita::Handlers::ApiAi.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
