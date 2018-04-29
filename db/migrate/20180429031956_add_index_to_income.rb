class AddIndexToIncome < ActiveRecord::Migration[5.1]
  def change
    add_index :incomes, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :incomes, :party_no
    add_index :incomes, :money
    add_index :incomes, :sundries
    add_index :incomes, :exp
    add_index :incomes, :is_pk
  end
end
