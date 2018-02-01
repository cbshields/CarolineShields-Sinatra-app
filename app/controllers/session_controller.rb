class SessionController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/courses'
    else
      erb:'/sessions/signup'
    end
  end

  post '/signup' do
    teacher = Teacher.find_by(username: params[:teacher][:username])
    if teacher
      erb :'/sessions/signup', locals: {message: "Please create a different username"}
    elsif params[:username] == "" || params[:password] == "" || params[:email] == "" || params[:name] == ""
        erb :'/sessions/signup', locals: {message: "Please sign up before you log in"}
    else
      @teacher = Teacher.create(params[:teacher])
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

    if teacher && teacher.authenticate(params[:password])

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
