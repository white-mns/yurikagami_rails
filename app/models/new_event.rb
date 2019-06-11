class NewEvent < ApplicationRecord
	belongs_to :event, :foreign_key => :event_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag,  :foreign_key => :flag_id,  :primary_key => :proper_id, :class_name => 'ProperName'
end
