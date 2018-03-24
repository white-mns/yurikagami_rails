class SkillDatum < ApplicationRecord
	belongs_to :timing_name,   :foreign_key => :timing,   :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :target_name,   :foreign_key => :target,   :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :property_name, :foreign_key => :property, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :element_name,  :foreign_key => :element,  :primary_key => :proper_id, :class_name => 'ProperName'
end
