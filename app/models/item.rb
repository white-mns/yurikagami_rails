class Item < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :kind,    :foreign_key => :kind_id,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :effect,  :foreign_key => :effect_id,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :ability, :foreign_key => :ability_id, :primary_key => :proper_id, :class_name => 'ProperName'
end
