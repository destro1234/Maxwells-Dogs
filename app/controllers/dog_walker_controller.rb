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

  post '/login' do
    @dogwalker = DogWalker.find_by(:username => params[:username], :password_digest => params[:password])
    session[:id] = @dogwalker.id
    redirect "/dogwalkers/#{@dogwalker.id}"
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      DogWalker.find(session[:id])
    end
  end

end
