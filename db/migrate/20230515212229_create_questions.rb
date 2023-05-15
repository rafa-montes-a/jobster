class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :desc
      t.text :prompt
      t.text :answer
      t.integer :job_id

      t.timestamps
    end
  end
end
