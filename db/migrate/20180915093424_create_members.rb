class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.references :log, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :log_id], unique: true
    end
  end
end
