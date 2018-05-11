ENV['ENVIRONMENT'] = 'test'

require './app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.before(:each) do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE bookmarks CASCADE;")
  end
end
