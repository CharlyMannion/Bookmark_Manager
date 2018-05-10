require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Delete a bookmark' do
  scenario 'delete a bookmark from the list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://test.com", title: "Test")
    visit '/bookmarks'

    click_button 'Delete'

    # expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Test'

  end
end
