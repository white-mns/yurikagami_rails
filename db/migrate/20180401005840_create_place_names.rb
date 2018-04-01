class CreatePlaceNames < ActiveRecord::Migration[5.1]
  def change
    create_table :place_names do |t|
      t.integer :place_id
      t.string :name

      t.timestamps
    end
  end
end
