class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :telephone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
