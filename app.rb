require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class BookmarkManager < Sinatra::Base


  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmark' do
    p "added a new bookmark"
    Bookmark.add(params[:title], params[:url])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
