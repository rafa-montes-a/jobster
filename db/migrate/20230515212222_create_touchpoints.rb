class CreateTouchpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :touchpoints do |t|
      t.string :description
      t.time :date
      t.text :notes
      t.integer :contact_id

      t.timestamps
    end
  end
end
