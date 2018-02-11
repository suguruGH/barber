class CreateStylists < ActiveRecord::Migration[5.1]
  def change
    create_table :stylists do |t|
      t.string :name
      t.integer :age
      t.text :image
      t.string :telephone_number
      t.text :strong_point
      t.integer :user_id

      t.timestamps
    end
  end
end
