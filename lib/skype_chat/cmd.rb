module SkypeChat

  class Cmd
    class << self
      def list
        Render.show_chat_list(ChatShortIDPairsMaker.make_pairs)
      end

      def read_chat(chat_id)
        raise 'Not exisiting chat id error' unless
          CmdOptValidator.chat_id_exists?(chat_id)

        chat = ChatShortIDPairsMaker.make_pairs[chat_id]
        messages = SkypeApp.get_recent_messages(chat.id)

        Render.show_messages(messages)
      end

      def stream(chat_id)
        raise 'Not existing chat id error' unless
          CmdOptValidator.chat_id_exists?(chat_id)

        chat = ChatShortIDPairsMaker.make_pairs[chat_id]
        ChatStream.new(chat).start
      end

      def send(chat_id, text)
        raise 'Not existing chat id error' unless
          CmdOptValidator.chat_id_exists?(chat_id)

        chat = ChatShortIDPairsMaker.make_pairs[chat_id]
        SkypeApp.send_message(chat.id, text)
      end
    end
  end

  class CmdOptValidator
    def self.chat_id_exists?(chat_id)
      short_ids = ShortChatIDsGetter.get_shorten_chat_ids(Chats.recent)
      return short_ids.include?(chat_id)
    end
  end

end
