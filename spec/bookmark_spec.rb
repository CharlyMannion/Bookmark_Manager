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

  describe '#==' do
    it 'two Bookmarks are equal if their url\'s match' do
      options = { url: 'http://test.com', title: 'test' }
      bookmark_1 = Bookmark.create(options)
      bookmark_2 = Bookmark.create(options)
      expect(bookmark_1).to eq bookmark_2
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://testbookmark.com', title: 'test')
      Bookmark.delete(bookmark.id)
      bookmarks = Bookmark.all
      expect(bookmarks).not_to include 'http://testbookmark.com'
    end
  end

  describe '.update' do
    it 'updates the url' do
      bookmark = Bookmark.create(url: 'http://testbookmark.com', title: 'test')
      new_url = 'http://testbookmark.co.uk'
      Bookmark.update(bookmark.id, new_url)
      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)
      expect(urls).not_to include 'http://testbookmark.com'
      expect(urls).to include 'http://testbookmark.co.uk'
    end
  end

  describe '.find' do
    it 'should find a bookmark' do
    p  bookmark = Bookmark.create( url: 'http://testbookmark.com', title: 'test')
    p  expect(Bookmark.find(bookmark.id)).to eq bookmark
    end
  end


end


# need to extract bookmark instances/test setup - REFACTOR
