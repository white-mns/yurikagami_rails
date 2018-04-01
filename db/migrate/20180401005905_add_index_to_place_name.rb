class AddIndexToPlaceName < ActiveRecord::Migration[5.1]
  def change
    add_index :place_names, :place_id
    add_index :place_names, :name
  end
end
