class WalkController < ApplicationController

  get '/walks/new' do
    if logged_in?
    erb :'/walks/new'
    else
      redirect '/'
    end
  end

  get '/walks/:id' do
    @walk = Walk.find(params[:id])

    if logged_in? && @walk.dog_walker == current_user
      erb :'/walks/show'
    else
      redirect "/dogwalkers/#{current_user.id}"
    end
  end

  get '/walks/:id/edit' do
    @walk = Walk.find(params[:id])

    if logged_in? && @walk.dog_walker == current_user

    erb :'/walks/edit'
    else
      redirect "/dogwalkers/#{current_user.id}"
    end
  end

  post '/walks' do
    if params[:dog][:name].empty? || params[:dog][:address].empty? || params[:walk][:date].empty? || params[:walk][:pickup_time].empty? || params[:walk][:length].empty?
      redirect '/walks/new'
    else
    @walk = Walk.new(params[:walk])
    @walk.dog_walker = current_user
    @walk.dogs << Dog.find_or_create_by(:name=> params[:dog][:name], :owner_name=> params[:dog][:owner_name], :address=> params[:dog][:address])
    @walk.save
    redirect "/dogwalkers/#{@walk.dog_walker.id}"
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
    redirect "/dogwalkers/#{current_user.id}"
  end
end
