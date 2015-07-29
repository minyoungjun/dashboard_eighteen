class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
  
      t.integer :snap_id
      t.string :name

      t.timestamps null: false
    end
  end
end
