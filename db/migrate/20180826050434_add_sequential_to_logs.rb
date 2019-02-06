class AddSequentialToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :sequential_id, :integer
  end
  # 複合ユニーク制約
  add_index :logs, [:user_id, :sequential_id], unique: true
end
