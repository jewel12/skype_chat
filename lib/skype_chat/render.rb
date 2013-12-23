require 'term/ansicolor'

class String
  include Term::ANSIColor
end

module SkypeChat

  class Render
    class << self

      def puts(message)
        STDOUT.puts(message)
        STDOUT.flush
      end

      def show_message_line(message)
        time_str = message.timestamp.strftime('[%m-%d %H:%M]')
        line = [message.sender.green.bold]
        line << ':'
        line << message.body.bold
        line << time_str.yellow
        line << message.chat.topic.cyan if message.chat.topic
        line << message.chat.short_id.cyan
        self.puts line.join(' ')
      end

      def show_messages(messages)
        messages.each { |m| self.show_message_line(m) }
      end

      def show_chat_list(short_chat_id_pairs, color=true)
        Term::ANSIColor.coloring = false unless color        
        short_chat_id_pairs.each do |short_id, chat|
          line = [short_id.green.bold]
          line << chat.topic.blue if chat.topic
          line << chat.members[0..2].join(' ').yellow
          self.puts line.join(' ')
        end
      end

    end
  end

end
