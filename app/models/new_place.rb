class NewPlace < ApplicationRecord
	belongs_to :place, :foreign_key => :place_id, :primary_key => :proper_id, :class_name => 'ProperName'
end
