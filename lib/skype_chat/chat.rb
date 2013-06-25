module SkypeChat

  module Error
    class NoChatIDError < StandardError; end
  end

  class Chat
    def initialize(id)
      @id = id
    end

    attr_reader :id

    def topic
      return @topic ||= SkypeApp.get_chat_topic(@id)
    end

    def members
      return @members ||= SkypeApp.get_chat_members(@id)
    end

    def recent_messages
      return SkypeApp.get_recent_messages(@id)
    end

    def short_id
      return @short_id ||=
        ChatShortIDPairsMaker.make_inverted_pairs[@id]
    end
  end

end
