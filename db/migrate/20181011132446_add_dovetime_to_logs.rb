class AddDovetimeToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :dove_time, :time
    add_column :logs, :total_min, :integer
  end
end
