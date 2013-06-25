module SkypeChat

  class Chats
    def self.recent
      return SkypeApp.get_recent_chats
    end
  end

end
