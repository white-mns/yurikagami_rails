class CreateCurrentPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :current_places do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :place_id
      t.integer :shop
      t.integer :inn

      t.timestamps
    end
  end
end
