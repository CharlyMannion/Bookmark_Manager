require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Updating bookmark' do
  scenario 'update a bookmark\'s url' do
    Bookmark.create(url: "http://test.com", title: "Test")
    visit '/bookmarks'
    click_button 'Update'
    fill_in('url', with: 'http://newtest.com')
    click_button('Update url')
    expect(page).to have_link(href: 'http://newtest.com')
  end
end
