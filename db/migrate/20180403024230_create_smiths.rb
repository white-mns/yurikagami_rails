class CreateSmiths < ActiveRecord::Migration[5.1]
  def change
    create_table :smiths do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :last_result_no
      t.integer :last_generate_no
      t.integer :party_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :result_i_no
      t.integer :source_i_no
      t.integer :main_material_i_no
      t.integer :sub_material_1_i_no
      t.integer :sub_material_2_i_no
      t.integer :sub_material_3_i_no
      t.integer :sub_material_4_i_no
      t.integer :main_material_name_id
      t.integer :sub_material_1_name_id
      t.integer :sub_material_2_name_id
      t.integer :sub_material_3_name_id
      t.integer :sub_material_4_name_id

      t.timestamps
    end
  end
end
