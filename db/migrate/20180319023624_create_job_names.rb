class CreateJobNames < ActiveRecord::Migration[5.1]
  def change
    create_table :job_names do |t|
      t.integer :job_id
      t.string :name

      t.timestamps
    end
  end
end
