class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :last_result_no
      t.integer :last_generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :main_no
      t.integer :i_no
      t.string :i_name
      t.integer :value

      t.timestamps
    end
  end
end
