class AddIndexToMaterialPrice < ActiveRecord::Migration[5.1]
  def change
    add_index :material_prices, :name
    add_index :material_prices, :price
    add_index :material_prices, :performance
    add_index :material_prices, :is_sub
  end
end
