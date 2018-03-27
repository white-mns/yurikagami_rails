class NewEvent < ApplicationRecord
	belongs_to :event_name, :foreign_key => :event,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag_name,  :foreign_key => :flag,    :primary_key => :proper_id, :class_name => 'ProperName'
end
