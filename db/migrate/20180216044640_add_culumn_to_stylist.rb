class AddCulumnToStylist < ActiveRecord::Migration[5.1]
  def change
    add_column :stylists, :email, :string
  end
end
