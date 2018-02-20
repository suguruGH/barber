class AddColumnToStylist < ActiveRecord::Migration[5.1]
  def change
    add_column :stylists, :password_digest, :string
  end
end
