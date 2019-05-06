class WalkController < ApplicationController

  get '/walks/new' do
    if logged_in?
    erb :'/walks/new'
    else
      redirect '/'
    end
  end

  get '/walks/:id' do
    if logged_in?
    @walk = Walk.find(params[:id])
    erb :'/walks/show'
    else
      redirect '/'
    end
  end

  get '/walks/:id/edit' do
    if logged_in?
    @walk = Walk.find(params[:id])
    erb :'/walks/edit'
    else
      redirect '/'
    end
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
    @walk.dogs << Dog.find_or_create_by(:name=> params[:dog][:name], :owner_name=> params[:dog][:owner_name], :address=> params[:dog][:address])
    @walk.save
    redirect "/walks/#{@walk.id}"
  end

  delete '/walks/:id/delete' do
    @walk = Walk.find(params[:id])
    @walk.delete
    redirect "/dogwalkers/#{@walk.dog_walker.id}"
  end
end
