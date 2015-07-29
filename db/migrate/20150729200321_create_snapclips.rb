class CreateSnapclips < ActiveRecord::Migration
  def change
    create_table :snapclips do |t|
      t.integer :snap_id
      t.integer :clip_id
      t.integer :view
      t.timestamps null: false
    end
  end
end
