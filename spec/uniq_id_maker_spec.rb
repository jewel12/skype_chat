# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__)) + '/spec_helper.rb'
include SkypeChat

describe ShortUniqIDsMaker do
  describe '.shorten_uniq_ids' do
    it '各要素がユニークなリストから短い一意なIDを生成できる' do
      uniq_ids = %w(aaaaaaaaaaaaa bbbbbbbbbbbbb ccccccccccccc)
      remaked_ids = ShortUniqIDsMaker.shorten_uniq_ids(uniq_ids)
      expect(remaked_ids.uniq.size).to eq(remaked_ids.size)
    end

    context '各要素がユニークでないリストが渡されたとき' do
      it 'nilが返される' do
        uniq_ids = %w(aaa bbb ccc aaa)
        expect(ShortUniqIDsMaker.shorten_uniq_ids(uniq_ids)).to be(nil)
      end
    end
  end
end
