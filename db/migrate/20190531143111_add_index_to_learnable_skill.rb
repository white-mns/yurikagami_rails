class AddIndexToLearnableSkill < ActiveRecord::Migration[5.2]
  def change
    add_index :learnable_skills, :chara_type
    add_index :learnable_skills, :job_id
    add_index :learnable_skills, :sp
    add_index :learnable_skills, :skill_no
    add_index :learnable_skills, :skill_id
  end
end
