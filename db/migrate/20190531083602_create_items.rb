class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :item_no
      t.string :name
      t.integer :kind_id
      t.integer :effect_id
      t.integer :effect_num
      t.integer :slash
      t.integer :charge
      t.integer :magic
      t.integer :guard
      t.integer :protect
      t.integer :have_rest
      t.integer :have_max
      t.integer :prize
      t.integer :ability_id
      t.integer :equip

      t.timestamps
    end
  end
end
