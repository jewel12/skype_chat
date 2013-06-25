require 'digest/md5'

module SkypeChat

  class ShortChatIDsGetter
    def self.get_shorten_chat_ids(chats)
      hashed_ids = chats.map(&:id).map { |id| Digest::MD5.hexdigest(id) }
      return ShortUniqIDsMaker.shorten_uniq_ids(hashed_ids)
    end
  end

  class ShortUniqIDsMaker
    def self.shorten_uniq_ids(ids, offset = 0)
      return nil unless ids.uniq.size == ids.size
      shorten_ids = ids.map { |id| id[0..offset] }
      return shorten_ids if shorten_ids.uniq.size == shorten_ids.size
      self.shorten_uniq_ids(ids, offset + 1)
    end
  end

end
