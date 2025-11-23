class LearnableSkill < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :skill_data, :foreign_key => :skill_id, :primary_key => :skill_id, :class_name => 'SkillDatum'
	belongs_to :job_name,  :foreign_key => :job_id,   :primary_key => :job_id,   :class_name => 'JobName'
end
