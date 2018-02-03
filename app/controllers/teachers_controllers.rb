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

    get '/teachers/:slug/edit' do
      if logged_in?
        @teacher = Teacher.find_by_slug(params[:slug])
        erb :'/teachers/edit'
      else
        redirect '/login'
      end
    end

    patch '/teachers/:slug' do
      @teacher = Teacher.find_by_slug(params[:slug])
      if @teacher.id == current_user.id
          @teacher.update(params[:teacher])
          @teacher.save
          erb :'/teachers/show'
      end
       redirect '/teachers'
    end


    delete '/teachers/:slug/delete' do
      if logged_in?
        @teacher = Teacher.find_by_slug(params[:slug])

          if @teacher.id == current_user.id
            @teacher.destroy
            redirect '/teachers'
          else
            redirect '/teachers'
          end
      else
        redirect '/login'
      end
    end

end #Ends TeachersController
