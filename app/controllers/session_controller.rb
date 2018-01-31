class SessionController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/courses'
    else
      erb:'/sessions/signup'
    end
  end

  post '/signup' do
    binding.pry
    if params[:username] == "" || params[:password] == "" || params[:email] == "" || params[:name] == ""
      redirect to '/signup'
    else
      @teacher = Teacher.create(params[:teacher])
      binding.pry
      session[:user_id] = @teacher.id
      redirect to '/courses'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/courses'
    else
      erb :'/sessions/login'
    end

  end

  post '/login' do
    teacher = Teacher.find_by(username: params[:username] )
    binding.pry
    if teacher && teacher.authenticate(params[:password])
      binding.pry
      session[:user_id] = teacher.id
      redirect '/courses'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/courses'
    end
  end

end #Ends SessionController
