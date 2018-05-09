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

  scenario 'User tries to add an invalid url to Bookmark Manager' do
  p  visit '/bookmarks/new'
  p  fill_in('url', with: 'not a valid url')
  p  click_button('Submit')
  p  expect(page).not_to have_content "not a valid url"
  p  expect(page).to have_content "invalid url"
  end
  end
