class ListingsController < ApplicationController
  get '/listings' do
    redirect_if_not_logged_in
    @listings = current_user.listings
    erb :'listings/index'
  end

  get '/listings/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'listings/new'
  end

  post '/listings' do
    redirect_if_not_logged_in

    unless Listing.valid_params?(params)
      redirect '/listings/new?error=invalid posting'
    end
    Listing.create(params)
    redirect '/listings'
  end

  get '/listings/:id' do
    redirect_if_not_logged_in
    @listings = Listing.find(params[:id])
    erb :'listings/show'
  end

  get '/listings/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @listing = Listing.find(params[:id])
    erb :'listings/edit'
  end

  delete '/listings/:id/delete' do
    @listing = Listing.find(params[:id])
    @userid = current_user
    if @userid.id == @listing.user.id # && !!session[:user_id]
      @listing.delete
      redirect '/'
    else
      redirect '/login'
    end
  end

  patch '/listings/:id' do
    @listing = Listing.find_by_id(params[:id])
    @userid = current_user
    if params[:title] == '' && params[:price] == '' && params[:location] == '' && params[:description] == ''
      redirect "/listings/#{params[:id]}/edit"
    elsif @userid.id == @listing.user.id
      @listing.title = params[:title]
      @listing.price = params[:price]
      @listing.location =  params[:location]
      @listing.description = params[:description]
      @listing.save
      redirect to '/listings'
    else
      redirect to '/listings'
    end
  end
end
