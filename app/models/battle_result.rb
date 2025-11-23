class BattleResult < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :enemy_party_info, :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'EnemyPartyInfo'
	belongs_to :income,           :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'Income'
end
