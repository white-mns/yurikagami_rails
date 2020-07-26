class CurrentPlace < ApplicationRecord
	belongs_to :party_info, :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'PartyInfo'
	belongs_to :place, :foreign_key => :place_id,    :primary_key => :proper_id, :class_name => 'ProperName'

    scope :where_start, ->() {
        place_id = Hash[*ProperName.pluck(:name, :proper_id).flatten]
        self.includes(:party_info).where(place_id: [place_id["リバーシ"], place_id["キシェタトル"], place_id["平須"]]).where("party_infos.battler_num = 0")
    }

    scope :to_start_graph, ->(column) {
        place_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        self.pluck(column, :member_num).inject(Hash.new(0)){|hash, a| hash[place_name[a[0]]] += a[1] ; hash}.sort_by{ |k, v| v}
    }

end
