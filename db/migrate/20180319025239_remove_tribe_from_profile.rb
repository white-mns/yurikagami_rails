class RemoveTribeFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :tribe
  end
end
