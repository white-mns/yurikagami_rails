class LearnableSkill < ApplicationRecord
	belongs_to :skill_data, :foreign_key => :skill_id, :primary_key => :skill_id, :class_name => 'SkillDatum'
	belongs_to :job_name,  :foreign_key => :job_id,   :primary_key => :job_id,   :class_name => 'JobName'
end
