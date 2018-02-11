class CreateStylistFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :stylist_favorites do |t|
      t.integer :user_id
      t.integer :stylist_id

      t.timestamps
    end
  end
end
