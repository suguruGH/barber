class AddColumnToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :email, :string
  end
end
