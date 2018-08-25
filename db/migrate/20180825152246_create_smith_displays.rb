class CreateSmithDisplays < ActiveRecord::Migration[5.1]
  def change
    create_table :smith_displays do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :total_price
      t.float :price_rate
      t.float :display_rate

      t.timestamps
    end
  end
end
