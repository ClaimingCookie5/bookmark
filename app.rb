require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark.rb'

class Manager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do 
    @bookmark = Bookmark.all
    erb(:'bookmarks/index')
  end 

  get '/submit_bookmark' do
    erb(:'bookmarks/submit_bookmark')

  end

  post '/add_bookmark' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end