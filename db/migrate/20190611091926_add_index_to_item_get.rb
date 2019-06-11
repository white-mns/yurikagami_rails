class AddIndexToItemGet < ActiveRecord::Migration[5.2]
  def change
    add_index :item_gets, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :item_gets, :party_no
    add_index :item_gets, :enemy_id
    add_index :item_gets, :item_id
    add_index :item_gets, :i_no
    add_index :item_gets, :is_pk
  end
end
