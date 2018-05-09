require 'bookmark'
require 'pg'
require 'spec_helper'
require 'uri'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark_1 = Bookmark.create(url: "http://makersacademy.com", title: "Makers")
      bookmark_2 = Bookmark.create(url: "http://google.com", title: "Google")
      bookmark_3 = Bookmark.create(url: "http://destroyallsoftware.com", title: "Destroy")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'raises an error if url is invalid' do
    Bookmark.create(url: 'invalidurl.cop')
    expect(Bookmark.all).not_to include 'invalidurl.cop'
    end

    it 'creates a new bookmark' do
      test_bookmark = Bookmark.create(url: 'http://testbookmark.com', title: 'test')
      expect(Bookmark.all).to include test_bookmark
    end
  end

end
