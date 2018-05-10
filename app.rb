require 'sinatra/base'
require './lib/bookmark'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:test)
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    bookmark = Bookmark.create(url: params['url'], title: params['title'])
    flash[:notice] = "invalid url" unless bookmark
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/delete/:id' do
    Bookmark.delete(params['id'])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
