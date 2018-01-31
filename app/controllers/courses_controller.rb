class CoursesController < ApplicationController

  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'/courses/index'
    else
      redirect '/login'
    end
  end




end #Ends CoursesController
