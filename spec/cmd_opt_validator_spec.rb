# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__)) + '/spec_helper.rb'

describe CmdOptValidator do

  describe '.chat_id_exists?' do

    context '存在するIDを検証するとき' do
      it 'trueを返す' do
        ids = %w(aa bb cc)
        ShortChatIDsGetter.stub!(:get_shorten_chat_ids).and_return(ids)
        expect(CmdOptValidator.chat_id_exists?('aa')).to be_true
      end
    end

    context '存在しないIDを検証するとき' do
      it 'falseを返す' do
        ids = %w(aa bb cc)
        ShortChatIDsGetter.stub!(:get_shorten_chat_ids).and_return(ids)
        expect(CmdOptValidator.chat_id_exists?('dd')).to be_false
      end
    end
  end

end
