require 'time'
require 'skype'

module SkypeChat

  class SkypeApp
    class << self
      def get_recent_chats
        api_res = Skype.search('recentchats')
        chat_ids = api_res.sub(/^CHATS\s+/, '').split(', ')
        chats = chat_ids.map { |id| Chat.new(id) }
        return chats
      end

      def get_chat_topic(chat_id)
        api_res = Skype.get(:chat, chat_id, :topic)
        topic = api_res.split(' ')[3..-1].join(' ')
        return nil if topic.empty?
        return topic
      end

      def get_chat_members(chat_id)
        api_res = Skype.get(:chat, chat_id, :members)
        members = api_res.split(' ')[3..-1]
        return members
      end

      def get_recent_messages(chat_id)
        api_res = Skype.get(:chat, chat_id, :recentchatmessages)
        message_ids =
          api_res.sub(/^CHAT\s.+RECENTCHATMESSAGES\s/, '').split(', ')

        chat = Chat.new(chat_id)
        messages = message_ids.map { |id| Message.new(id, chat) }

        return messages
      end

      def get_message_body(message_id)
        api_res = Skype.get(:message, message_id, :body)
        body = api_res.split(' ', 4).last
        return body
      end

      def get_message_sender(message_id)
        api_res = Skype.get(:message, message_id, :from_dispname)
        sender = api_res.split(' ', 4).last
        return sender
      end

      def get_message_timestamp(message_id)
        api_res = Skype.get(:message, message_id, :timestamp)
        timestamp = api_res.split(' ', 4).last.to_i
        return Time.at(timestamp)
      end

      def send_message(chat_id, text)
        Skype.chatmessage(chat_id, text)
      end
    end
  end

end
