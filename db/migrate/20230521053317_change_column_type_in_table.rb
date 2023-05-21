class ChangeColumnTypeInTable < ActiveRecord::Migration[6.0]
  def change
    change_column :touchpoints, :date, :datetime, precision: 6
  end
end
