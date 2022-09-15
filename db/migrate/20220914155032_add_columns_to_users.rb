class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :digest_password, :string
    add_column :users, :email, :string
  end
end
