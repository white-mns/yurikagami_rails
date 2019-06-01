class SkillDatum < ApplicationRecord
	belongs_to :timing,    :foreign_key => :timing_id,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :target,    :foreign_key => :target_id,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :property,  :foreign_key => :property_id,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :element,   :foreign_key => :element_id,   :primary_key => :proper_id, :class_name => 'ProperName'
end
