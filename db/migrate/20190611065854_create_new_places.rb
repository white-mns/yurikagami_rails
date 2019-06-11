class CreateNewPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :new_places do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :place_id

      t.timestamps
    end
  end
end
