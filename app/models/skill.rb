class Skill < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :skill_data, :foreign_key => :skill_id,    :primary_key => :skill_id, :class_name => 'SkillDatum'
end
