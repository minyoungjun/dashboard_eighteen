class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.integer :source #0: facebook, 1: youtube, 2: twitter
      t.integer :video_id
      t.string  :source_id
      t.integer :view, default: 0

      t.timestamps null: false
    end
  end
end
