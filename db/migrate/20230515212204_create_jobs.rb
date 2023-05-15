class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :firm_name
      t.string :role
      t.text :job_desc
      t.string :job_desc_link
      t.string :follow_up_link
      t.string :status
      t.text :summary_job_desc
      t.string :country
      t.string :city
      t.string :state
      t.string :job_number
      t.integer :firm_id
      t.integer :user_id

      t.timestamps
    end
  end
end
