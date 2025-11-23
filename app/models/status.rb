class Status < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :job1,        :foreign_key => :job1_id,        :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :job2,        :foreign_key => :job2_id,        :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :personality, :foreign_key => :personality_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :tribe,       :foreign_key => :tribe_id,       :primary_key => :proper_id, :class_name => 'ProperName'

    scope :to_job_graph, ->(column) {
        job_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        self.pluck(column).inject(Hash.new(0)){|hash, a| hash[job_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
    }

end
