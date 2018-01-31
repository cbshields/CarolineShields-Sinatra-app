class SessionController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/courses'
    else
      erb :'/sessions/login'
    end

  end

  post '/login' do
    teacher = Teacher.find_by(username: params[:username] )
    if teacher && teacher.authenticate(params[:password])
      session[:user_id] = teacher.id
      redirect '/courses'
    else
      redirect '/login'
    end
  end

  get 'logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/courses'
    end
  end

end #Ends SessionController
