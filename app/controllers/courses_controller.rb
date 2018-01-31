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

  get '/courses/:slug/edit' do
    if logged_in?
      @course = Course.find_by_slug(params[:slug])
      binding.pry
      erb :'/courses/edit'
    else
      redirect '/login'
    end
  end

  patch '/courses/:slug' do
    @course = Course.find_by_slug(params[:slug])
    binding.pry
    @course.update(params[:course])
    @course.save
    redirect "/courses/#{@course.slug}"
  end

  delete '/courses/:slug/delete' do
    if logged_in?
      @course = Course.find_by_slug([:slug])
      if @course.teacher_id == current_user.id
        @course.delete
        redirect '/courses'
      else
        redirect '/courses'
      end
    else
      redirect '/login'
    end
  end


end #Ends CoursesController
