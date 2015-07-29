class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.integer :source #0: facebook, 1: youtube, 2: twitter, 3: everyshot, 4: naver, 5: kakaotalk
      t.integer :video_id
      t.string  :source_id
      t.integer :view, default: 0
      t.boolean :not_video, default: false
      t.integer :like, default: 0
      t.integer :comment, default: 0
      t.integer :retweet, default: 0

      t.timestamps null: false
    end
    add_index :clips, :source_id, unique: true
  end
end
