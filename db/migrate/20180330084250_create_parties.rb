class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :e_no
      t.integer :sub_no

      t.timestamps
    end
  end
end
