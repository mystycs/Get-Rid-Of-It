class ListingsController < ApplicationController

  get "/listings" do
    redirect_if_not_logged_in
    @listings = current_user.listings
    erb :'listings/index'
  end

  get "/listings/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'listings/new'
  end

  post "/listings" do
  redirect_if_not_logged_in

  unless Listing.valid_params?(params)
    redirect "/listings/new?error=invalid posting"
  end
  Listing.create(params)
  redirect "/listings"
end

  get "/listings/:id" do
  redirect_if_not_logged_in
  @listings = Listing.find(params[:id])
  erb :'listings/show'
end

end
