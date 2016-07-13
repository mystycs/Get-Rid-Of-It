class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.float :price
      t.string :location
      t.text :description
    end
  end
end
