class LearnableSkill < ApplicationRecord
	belongs_to :job,    :foreign_key => :job_id,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :skill,  :foreign_key => :skill_id,  :primary_key => :skill_id,  :class_name => 'SkillDatum'
end
