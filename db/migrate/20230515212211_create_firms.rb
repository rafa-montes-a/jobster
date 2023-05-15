class CreateFirms < ActiveRecord::Migration[6.0]
  def change
    create_table :firms do |t|
      t.string :firm_name
      t.integer :user_id

      t.timestamps
    end
  end
end
