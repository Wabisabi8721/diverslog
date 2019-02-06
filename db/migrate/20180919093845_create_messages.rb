class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :speaker, foreign_key: { to_table: :users}
      t.references :receiver, foreign_key: { to_table: :users}
      t.references :log, foreign_key: true
      t.string :comment

      t.timestamps
      
      t.index [:speaker_id, :receiver_id, :log_id], unique: true
    end
  end
end
