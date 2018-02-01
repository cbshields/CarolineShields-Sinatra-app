class TeachersController < ApplicationController

  get '/teachers' do
    if logged_in?
      @teachers = Teacher.all
      erb :'/teachers/index'
    else
      redirect '/login'
    end

  end

  get '/teachers/:slug' do
    if logged_in?
      @teacher = Teacher.find_by_slug(params[:slug])
      erb :'/teachers/show'
    else
      redirect '/login'
    end


  end

end #Ends TeachersController
