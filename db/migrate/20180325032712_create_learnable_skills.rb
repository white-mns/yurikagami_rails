class CreateLearnableSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :learnable_skills do |t|
      t.integer :chara_type
      t.integer :job_id
      t.integer :sp
      t.integer :skill_no
      t.integer :skill_id

      t.timestamps
    end
  end
end
