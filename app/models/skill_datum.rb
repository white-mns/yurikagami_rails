class SkillDatum < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :timing_name,   :foreign_key => :timing,   :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :target_name,   :foreign_key => :target,   :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :property_name, :foreign_key => :property, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :element_name,  :foreign_key => :element,  :primary_key => :proper_id, :class_name => 'ProperName'
end
