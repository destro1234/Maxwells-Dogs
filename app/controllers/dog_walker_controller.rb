class DogWalkerController < ApplicationController

  get '/signup' do
    erb :'/dogwalkers/signup'
  end

  get '/login' do
    erb :'/dogwalkers/login'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end



  get '/dogwalkers/:id' do
    @dogwalker = DogWalker.find(params[:id])
    erb :'/dogwalkers/show'
  end

  post '/signup' do
    @dogwalker = DogWalker.new(:name => params[:name], :username => params[:username], :password => params[:password])

    if @dogwalker.save
    session[:id] = @dogwalker.id
    redirect "/dogwalkers/#{@dogwalker.id}"
    else
      redirect '/signup'
    end
  end

  post '/login' do
    @dogwalker = DogWalker.find_by(:username => params[:username])

    if @dogwalker && @dogwalker.authenticate(params[:password])
    session[:id] = @dogwalker.id
    redirect "/dogwalkers/#{@dogwalker.id}"
    else
      redirect '/'
    end
  end

end
