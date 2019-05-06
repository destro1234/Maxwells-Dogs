class DogWalkerController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/dogwalkers/#{current_user.id}"
    else
      erb :'/dogwalkers/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/dogwalkers/login'
    else
      redirect "/dogwalkers/#{current_user.id}"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/dogwalkers/:id' do
    @dogwalker = DogWalker.find(params[:id])

    if logged_in? && @dogwalker == current_user
    erb :'/dogwalkers/show'
    else
      redirect '/'
    end
  end

  post '/signup' do
    if params[:name].empty? || params[:username].empty? || params[:password].empty?
      redirect '/signup'
    elsif DogWalker.find_by(:username=> params[:username])
      redirect '/signup'
    else
      @dogwalker = DogWalker.create(:name => params[:name], :username => params[:username], :password => params[:password])
      session[:user_id] = @dogwalker.id
      redirect "/dogwalkers/#{@dogwalker.id}"
    end
  end

  post '/login' do
    @dogwalker = DogWalker.find_by(:username => params[:username])

    if @dogwalker && @dogwalker.authenticate(params[:password])
      session[:user_id] = @dogwalker.id
      redirect "/dogwalkers/#{@dogwalker.id}"
    else
      redirect '/'
    end
  end

end
