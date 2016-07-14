class Listing < ActiveRecord::Base
  belongs_to :user

  def self.valid_params?(params)
    !params[:title].empty? && !params[:price].empty? && !params[:location].empty?
  end
end
