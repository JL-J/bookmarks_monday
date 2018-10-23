require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class BookmarkManager < Sinatra::Base
  before do
    @bookmarks = Bookmarks.instance
  end

  get '/' do
    @bookmarks = Bookmarks.create
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/bookmark' do
    @bookmarks.add(params[:url])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
