class AddIndexToItem < ActiveRecord::Migration[5.1]
  def change
    add_index :items, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :items, :name
    add_index :items, :kind
    add_index :items, :effect
    add_index :items, :effect_num
    add_index :items, :slash
    add_index :items, :charge
    add_index :items, :magic
    add_index :items, :guard
    add_index :items, :protect
    add_index :items, :have_rest
    add_index :items, :have_max
    add_index :items, :prize
    add_index :items, :ability
    add_index :items, :equip
  end
end
