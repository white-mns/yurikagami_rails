class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.string :name

      t.timestamps
    end
  end
end
