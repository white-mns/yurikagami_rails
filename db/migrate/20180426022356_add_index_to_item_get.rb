class AddIndexToItemGet < ActiveRecord::Migration[5.1]
  def change
    add_index :item_gets, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :item_gets, :party_no
    add_index :item_gets, :enemy
    add_index :item_gets, :item
    add_index :item_gets, :is_pk
  end
end
