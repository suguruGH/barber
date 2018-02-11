class CreateOwnerFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :owner_favorites do |t|
      t.integer :user_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
