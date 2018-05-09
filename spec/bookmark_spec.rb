require 'bookmark'
require 'pg'
require 'spec_helper'
require 'uri'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(url: "http://makersacademy.com")
      Bookmark.create(url: "http://google.com")
      Bookmark.create(url: "http://destroyallsoftware.com")

      expected_bookmarks = [
        "http://makersacademy.com",
        "http://google.com",
        "http://destroyallsoftware.com"
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'raises an error if url is invalid' do
      expect { Bookmark.create(url: 'invalidurl.cop') }.to raise_error "invalid url"
    end

    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://testbookmark.com')

      expect(Bookmark.all).to include 'http://testbookmark.com'
    end
  end

end
