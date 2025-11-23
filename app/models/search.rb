class Search < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :status,	 :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Status'
	belongs_to :item,	 :foreign_key => [:result_no, :e_no, :i_no, :main_no, :generate_no], :primary_key => [:result_no, :e_no, :item_no, :sub_no, :generate_no], :class_name => 'Item'
end
