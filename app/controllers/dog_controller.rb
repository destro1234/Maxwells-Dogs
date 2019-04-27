class DogController < ApplicationController

  get '/dogs/new' do
    if logged_in?
    erb :'/dogs/new'
    else
      redirect '/'
    end
  end

  get '/dogs/:id' do
    @dog = Dog.find(params[:id])
    erb :'/dogs/show'
  end

  get '/dogs/:id/edit' do
    if logged_in?
    @dog = Dog.find(params[:id])
    erb :'/dogs/edit'
    else
      redirect '/login'
    end
  end

  post '/dogs' do
    @dog = Dog.new(:name => params[:dog][:name], :temperament => params[:dog][:temperament], :friends => params[:dog][:friends])
    @dog.save
    redirect "/dogs/#{@dog.id}"
  end

  patch '/dogs/:id/edit' do
    @dog = Dog.find(params[:id])
    @dog.update(params[:dog])
    @dog.save
    redirect "/dogs/#{@dog.id}"
  end
end
