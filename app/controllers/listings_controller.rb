class ListingsController < ApplicationController

  get "/listings" do
    redirect_if_not_logged_in
    erb :'listings/index'
  end

end
