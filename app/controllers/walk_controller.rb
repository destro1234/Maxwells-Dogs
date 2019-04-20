class WalkController < ApplicationController

  get '/walks' do
    @walks = Walk.all
    erb :'/walks/index'
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
    @walk = Walk.new(:address => params[:address], :pickup_time => params[:pickup_time], :dropoff_time => params[:dropoff_time])
    @walk.save
    redirect '/walks'
  end

  patch '/walks/:id' do
    @walk = Walk.find(params[:id])
    @walk.update(params[:walk])
    @walk.save
    redirect '/walks'
  end

  delete '/walks/:id/delete' do
    @walk = Walk.find(params[:id])
    @walk.delete
  end
end
