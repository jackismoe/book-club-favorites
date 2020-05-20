class CreateFavoriteLists < ActiveRecord::Migration
  def change
    create_table :favorite_lists do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end
end
