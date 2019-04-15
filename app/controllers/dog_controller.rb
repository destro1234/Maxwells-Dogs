class DogController < ApplicationController

  get '/dogs/new' do
    erb :'/dogs/new'
  end

  post '/dogs' do
    @dog = Dog.new(:name => params[:name], :temperament => params[:temperament], :friends => params[:friends])
    @dog.save
    redirect "/dogs/#{@dog.id}"
  end
end
