require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark.rb'

class Manager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do 
    @bookmark = Bookmark.all
    erb(:'bookmarks/index')
  end 

  run! if app_file == $0
end