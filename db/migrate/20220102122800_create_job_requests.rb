class CreateJobRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :job_requests do |t|
      t.integer :client_id
      t.string :title
      t.text :job_content
      t.string :recruitment_gender
      t.string :recruitment_stature
      t.string :recruitmebt_other
      t.integer :money
      t.string :contact

      t.timestamps
    end
  end
end
