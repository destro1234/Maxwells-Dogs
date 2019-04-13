class WalkController < ApplicationController

  get '/walks/new' do
    erb :'/walks/new'
  end
end
