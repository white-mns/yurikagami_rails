class AddIndexToItem < ActiveRecord::Migration[5.2]
  def change
    add_index :items, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :items, :name
    add_index :items, :kind_id
    add_index :items, :effect_id
    add_index :items, :effect_num
    add_index :items, :slash
    add_index :items, :charge
    add_index :items, :magic
    add_index :items, :guard
    add_index :items, :protect
    add_index :items, :have_rest
    add_index :items, :have_max
    add_index :items, :prize
    add_index :items, :ability_id
    add_index :items, :equip
  end
end
