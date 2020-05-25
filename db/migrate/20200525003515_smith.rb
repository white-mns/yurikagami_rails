class Smith < ActiveRecord::Migration[5.2]
  def change
    add_index :smiths, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :smiths, [:last_result_no, :last_generate_no],       :unique => false, :name => 'last_num'
    add_index :smiths, :party_no
    add_index :smiths, :result_i_no
    add_index :smiths, :source_i_no
    add_index :smiths, :main_material_i_no
    add_index :smiths, :sub_material_1_i_no
    add_index :smiths, :sub_material_2_i_no
    add_index :smiths, :sub_material_3_i_no
    add_index :smiths, :sub_material_4_i_no
    add_index :smiths, :main_material_name_id
    add_index :smiths, :sub_material_1_name_id
    add_index :smiths, :sub_material_2_name_id
    add_index :smiths, :sub_material_3_name_id
    add_index :smiths, :sub_material_4_name_id
  end
end
