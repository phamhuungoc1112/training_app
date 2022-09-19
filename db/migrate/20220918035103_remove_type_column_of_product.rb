class RemoveTypeColumnOfProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :type
  end
end
