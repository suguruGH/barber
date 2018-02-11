class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.integer :stylist_id
      t.integer :owner_id
  
      t.timestamps
    end
  end
end
