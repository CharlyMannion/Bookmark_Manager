require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Delete a bookmark' do
  scenario 'delete a bookmark from the list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://makersacademy.com", title: "Makers")
    visit '/bookmarks'

    within '#Makers' do
      click_button 'Delete'
    end

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Makers'

  end
end
