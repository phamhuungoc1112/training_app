class RemovePasswordAndPasswordConfirm < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password
    remove_column :users, :confirm_password
  
  end
end
