module Lita
  module Handlers
    class ApiAi < Handler
      on :unhandled_message, :chat
      config :api_key, type: String

      def self.api_key
        Lita.config.handlers.api_ai.api_key
      end

      def self.aibot
        @aibot ||= ApiAiRuby::Client.new(
          :client_access_token => api_key
      )
      end

      def chat(payload)
        message = payload[:message]
        return unless should_reply?(message)
        robot.send_message(message.source, build_response(message))
      end

      private

      def should_reply?(message)
        message.command? || message.body =~ /#{aliases.join('|')}/i
      end

      def build_response(message)
        message = extract_aliases(message)
        response = self.class.aibot.text_request message.body
        reply = response[:result][:fulfillment][:speech]

      end

      def extract_aliases(message)
        body = message.body.sub(/#{aliases.join('|')}/i, '').strip
        Message.new(robot, body, message.source)
      end

      def aliases
        [robot.mention_name, robot.alias].map{|a| a unless a == ''}.compact
      end

      Lita.register_handler(self)
    end
  end
end
