module SkypeChat

  class ChatShortIDPairsMaker
    def self.make_pairs
      chats = Chats.recent
      short_chat_ids = ShortChatIDsGetter.get_shorten_chat_ids(chats)
      return Hash[short_chat_ids.zip(chats)]
    end

    def self.make_inverted_pairs
      chats = Chats.recent
      short_chat_ids = ShortChatIDsGetter.get_shorten_chat_ids(chats)
      return Hash[chats.map(&:id).zip(short_chat_ids)]
    end
  end

end
