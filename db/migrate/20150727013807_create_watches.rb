class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.integer :timing_id
      t.integer :video_id
      t.timestamps null: false
    end
  end
end
