class NewEvent < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :event, :foreign_key => :event_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag,  :foreign_key => :flag_id,  :primary_key => :proper_id, :class_name => 'ProperName'
end
