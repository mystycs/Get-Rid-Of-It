class ListingsController < ApplicationController

  get "/listings" do
    redirect_if_not_logged_in
    @listings = Listing.all
    erb :'listings/index'
  end

  get "/listings/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'listings/new'
  end

end
