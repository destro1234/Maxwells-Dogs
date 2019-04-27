class DogController < ApplicationController


  get '/dogs/:id' do
    if logged_in?
    @dog = Dog.find(params[:id])
    erb :'/dogs/show'
    else
      redirect "/"
  end
  end

  get '/dogs/:id/edit' do
    if logged_in?
    @dog = Dog.find(params[:id])
    erb :'/dogs/edit'
    else
      redirect '/'
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
