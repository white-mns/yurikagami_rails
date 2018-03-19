class AddIndexToJobName < ActiveRecord::Migration[5.1]
  def change
    add_index :job_names, :job_id
    add_index :job_names, :name
  end
end
