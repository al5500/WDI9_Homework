require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/movies' do
  @title = params[:title]
  @url = "http://omdbapi.com/?s=#{@title}"
  @movie_data = HTTParty.get @url
   
    

  erb :movies
end

