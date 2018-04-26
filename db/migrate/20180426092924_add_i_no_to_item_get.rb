class AddINoToItemGet < ActiveRecord::Migration[5.1]
  def change
    add_column :item_gets, :i_no, :integer
  end
end
