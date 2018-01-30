class SessionController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/login' do
    user = Teacher.find_by(username: params[:username] )
    pry
  end

end
