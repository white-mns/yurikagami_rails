class CreateItemGets < ActiveRecord::Migration[5.2]
  def change
    create_table :item_gets do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :enemy_id
      t.integer :item_id
      t.integer :i_no
      t.integer :is_pk

      t.timestamps
    end
  end
end
