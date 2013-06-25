require 'skype'

module SkypeChat

  class ChatStream
    def initialize(chat)
      @chat = chat
    end

    def start
      old_messages = []
      loop do
        recent_messages = @chat.recent_messages
        Render.show_messages(recent_messages - old_messages)
        old_messages = recent_messages
        sleep 1
        end
    rescue Interrupt
      STDERR.puts 'Exit!'
      exit 1
    end

  end

end

