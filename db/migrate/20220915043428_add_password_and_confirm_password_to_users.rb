class AddPasswordAndConfirmPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password, :string
    add_column :users, :confirm_password, :string
  end
end
