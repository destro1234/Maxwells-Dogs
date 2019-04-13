class DogController < ApplicationController

  get '/dogs/new' do
    erb :'/dogs/new'
  end
end
