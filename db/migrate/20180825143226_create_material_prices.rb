class CreateMaterialPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :material_prices do |t|
      t.string :name
      t.integer :price
      t.integer :performance
      t.integer :is_sub

      t.timestamps
    end
  end
end
