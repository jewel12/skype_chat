module SkypeChat

  class Message
    def initialize(message_id, chat)
      @id = message_id
      @chat = chat
    end

    attr_reader :id, :chat

    def sender
      return @sender ||= SkypeApp.get_message_sender(@id)
    end

    def body
      return @body ||= SkypeApp.get_message_body(@id)
    end

    def timestamp
      return @timestamp ||= SkypeApp.get_message_timestamp(@id)
    end

    # To compare with other messages
    def hash
      @id.hash
    end

    # To compare with other messages
    def eql?(other)
      return @id == other.id
    end
  end

end
