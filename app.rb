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
    erb(:new)
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

  get '/update/:id' do
    @bookmark = Bookmark.find(params['id'])
    erb(:update)
  end

  post '/update/:id' do
    Bookmark.update(params['id'], params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
