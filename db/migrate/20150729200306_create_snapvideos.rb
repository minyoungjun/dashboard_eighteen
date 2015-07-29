class CreateSnapvideos < ActiveRecord::Migration
  def change
    create_table :snapvideos do |t|
      t.integer :video_id
      t.integer :snap_id
      t.integer :view
      t.timestamps null: false
    end
  end
end
