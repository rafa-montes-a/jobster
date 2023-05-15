class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :firm_name
      t.string :role
      t.string :email
      t.string :status
      t.integer :firm_id
      t.integer :user_id

      t.timestamps
    end
  end
end
