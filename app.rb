require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class BookmarkManager < Sinatra::Base

  before do
    @bookmarks = Bookmarks.instance
  end

  get '/' do
    @bookmarks = Bookmarks.create
    erb (:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0

end
