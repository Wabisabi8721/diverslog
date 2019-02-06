class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.date :dove_on
      t.time :dove_in_at
      t.time :dove_out_at
      t.float :depth_ave
      t.float :depth_max
      t.string :location
      t.string :creature

      t.timestamps
    end
  end
end
