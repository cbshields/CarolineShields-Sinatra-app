class CoursesController < ApplicationController

  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'/courses/index'
    else
      redirect '/login'
    end
  end

  get '/courses/new' do
    if logged_in?
      erb :'/courses/new'
    else
      redirect '/login'
    end
  end

  post '/courses' do
    if params[:course] == ""
      redirect '/courses/new'
    else
      @course = current_user.courses.create(params[:course])
      erb :'/courses/show'
    end
  end

  get '/courses/:slug' do
    if logged_in?
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/show'
    else
      redirect '/login'
    end
  end

  delete '/courses/:slug/delete' do
    if logged_in?
      @course = Course.find_by_slug([:slug])
      @course.delete
      redirect '/courses'
    else
      redirect '/login'
    end


  end


end #Ends CoursesController
