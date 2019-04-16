class DogController < ApplicationController

  get '/dogs/new' do
    erb :'/dogs/new'
  end

  get '/dogs/:id' do
    @dog = Dog.find(params[:id])
    erb :'/dogs/show'
  end

  post '/dogs' do
    @dog = Dog.new(:name => params[:dog][:name], :temperament => params[:dog][:temperament], :friends => params[:dog][:friends])
    @dog.save
    redirect "/dogs/#{@dog.id}"
  end
end
