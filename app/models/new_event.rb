class NewEvent < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :event_name, :foreign_key => :event,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag_name,  :foreign_key => :flag,    :primary_key => :proper_id, :class_name => 'ProperName'
end
