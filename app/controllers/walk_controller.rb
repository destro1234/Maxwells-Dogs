class WalkController < ApplicationController

  get '/walks' do
    @walks = Walk.all
    erb :'/walks/index'
  end

  get '/walks/new' do
    erb :'/walks/new'
  end

  post '/walks' do
    @walk = Walk.new(:address => params[:address], :pickup_time => params[:pickup_time], :dropoff_time => params[:dropoff_time])
    @walk.save
    redirect '/walks'
  end
end
