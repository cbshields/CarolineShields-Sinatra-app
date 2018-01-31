class CoursesController < ApplicationController

  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'/courses/index'
    else
      redirect '/login'
    end
  end

  get '/courses/:slug' do
    @course = Course.find_by_slug(params[:slug])
    erb :'/courses/show'
  end


end #Ends CoursesController
