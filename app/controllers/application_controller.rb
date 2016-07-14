require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'meowmix'
  end

  get '/' do
    @listings = Listing.all
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      redirect '/login?error=You must be logged in to do that!' unless logged_in?
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def active_page?(path = '')
      request.path_info == '/' + path
    end
  end
end
