class AddSequentialToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :sequential_id, :integer
  end
  
end
