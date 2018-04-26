class CreateItemGets < ActiveRecord::Migration[5.1]
  def change
    create_table :item_gets do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :enemy
      t.string :item
      t.integer :is_pk

      t.timestamps
    end
  end
end
