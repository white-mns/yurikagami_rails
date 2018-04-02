class CreateNewPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :new_places do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :place

      t.timestamps
    end
  end
end
