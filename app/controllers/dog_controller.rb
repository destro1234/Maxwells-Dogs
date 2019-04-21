class DogController < ApplicationController

  get '/dogs/new' do
    erb :'/dogs/new'
  end

  get '/dogs/:id' do
    @dog = Dog.find(params[:id])
    erb :'/dogs/show'
  end

  get '/dogs/:id/edit' do
    @dog = Dog.find(params[:id])
    erb :'/dogs/edit'
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
