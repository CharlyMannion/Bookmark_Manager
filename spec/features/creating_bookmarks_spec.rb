require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Adding a new bookmark' do
  scenario 'User adds a new bookmark to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://testbookmark.com'
    end
  end
