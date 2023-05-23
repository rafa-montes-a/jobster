class AddDateToTouchpoints < ActiveRecord::Migration[6.0]
  def change
    add_column :touchpoints, :date, :datetime, precision: 6
  end
end
