class DogWalkerController < ApplicationController

  get '/signup' do
    erb :'/dogwalkers/signup'
  end

  get '/login' do
    erb :'/dogwalkers/login'
  end

  get '/dogwalkers/:id' do
    @dogwalker = DogWalker.find(params[:id])
    erb :'/dogwalkers/show'
  end

  post '/signup' do
    @dogwalker = DogWalker.new(:name => params[:name], :username => params[:username], :password_digest => params[:password])
    @dogwalker.save
    session[:id] = @dogwalker.id
    redirect "/dogwalkers/#{@dogwalker.id}"
  end

end
