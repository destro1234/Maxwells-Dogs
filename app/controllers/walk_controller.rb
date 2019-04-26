class WalkController < ApplicationController

  get '/walks' do
    if logged_in?
    @walks = Walk.all
    erb :'/walks/index'
    else
      redirect '/'
    end
  end

  get '/walks/new' do
    erb :'/walks/new'
  end

  get '/walks/:id' do
    @walk = Walk.find(params[:id])
    erb :'/walks/show'
  end

  get '/walks/:id/edit' do
    @walk = Walk.find(params[:id])
    erb :'/walks/edit'
  end

  post '/walks' do
    if logged_in?
    @walk = Walk.new(params[:walk])
    @walk.dog_walker = current_user
    @walk.dogs << Dog.find_or_create_by(:name=> params[:dog][:name], :owner_name=> params[:dog][:owner_name], :address=> params[:dog][:address])
    @walk.save
    redirect "/dogwalkers/#{@walk.dog_walker.id}"
    else
      redirect "/walks"
    end
  end

  patch '/walks/:id/edit' do
    @walk = Walk.find(params[:id])
    @walk.update(params[:walk])
    @walk.save
    redirect "/walks/#{@walk.id}"
  end

  delete '/walks/:id/delete' do
    @walk = Walk.find(params[:id])
    @walk.delete
    redirect "/dogwalkers/#{@walk.dog_walker.id}"
  end
end
