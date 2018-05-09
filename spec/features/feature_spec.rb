require_relative '../../app.rb'
require 'spec_helper'

feature BookmarkManager do

  feature 'Testing infrastructure' do
      scenario 'should return string' do
        visit '/'
        expect(page).to have_content("Testing infrastructure working!")
    end
  end

  # feature 'Bookmark' do
  #   scenario 'view links' do
  #     visit '/bookmarks'
  #     expect(page).to have_content("http://google.com", "http://makersacademy.com", "http://bbc.co.uk")
  #   end
  # end

end
