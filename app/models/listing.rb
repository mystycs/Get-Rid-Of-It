class Listing < ActiveRecord::Base
  belongs_to :user

  def self.valid_params?(params)
    return !params[:title].empty? && !params[:price].empty? && !params[:location].empty?
  end

end
