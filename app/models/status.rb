class Status < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :tribe_name, :foreign_key => :tribe, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :job1_name, :foreign_key => :job1, :primary_key => :job_id, :class_name => 'JobName'
	belongs_to :job2_name, :foreign_key => :job2, :primary_key => :job_id, :class_name => 'JobName'

    def self.to_range_graph(column, range=50, figure_length=5)
        self.pluck(column).inject(Hash.new(0)){|hash, a| floor= (a/range).to_i()*range; hash[floor.to_s.rjust(figure_length) + "～" + (floor+range).to_s.rjust(figure_length)] += 1 ; hash}.sort
    end
    
    def self.to_job_graph(column)
        job_name = Hash[*JobName.pluck(:job_id, :name).flatten]
        self.pluck(column).inject(Hash.new(0)){|hash, a| hash[job_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
    end
end
