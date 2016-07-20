class UsersController < ApplicationController
  get '/signup' do
    @yellow_message = params[:notify]
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if params[:username] == '' || params[:password] == ''
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect '/'
    end
  end

  get '/login' do
    @yellow_message = params[:notify]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/?success=You have successfully logged in.'
    else
      redirect to '/signup?notify=This account does not exist. Please create an account.'
    end
  end

  get '/logout' do
    if !session[:user_id].nil?
      session.destroy
      redirect to '/?notify=You have successfully logged out.'
    else
      redirect to '/'
    end
  end
end
