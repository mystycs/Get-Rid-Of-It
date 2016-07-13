require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "kwyjibo" # https://www.youtube.com/watch?v=HMGWCSVRAzo
  end


  get '/' do
    erb :index
  end

end
