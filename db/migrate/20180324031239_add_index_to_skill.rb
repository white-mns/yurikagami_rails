class AddIndexToSkill < ActiveRecord::Migration[5.1]
  def change
    add_index :skills, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :skills, :skill_no
    add_index :skills, :skill_id
  end
end
