class RemoveDigestPasswordOfUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :digest_password
  end
end
