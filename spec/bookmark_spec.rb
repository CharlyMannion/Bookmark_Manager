require 'bookmark'
require 'pg'
require 'spec_helper'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com')")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://google.com')")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://destroyallsoftware.com')")

      expected_bookmarks = [
        "http://makersacademy.com",
        "http://google.com",
        "http://destroyallsoftware.com"
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

end
