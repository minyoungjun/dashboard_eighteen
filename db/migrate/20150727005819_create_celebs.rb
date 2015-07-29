class CreateCelebs < ActiveRecord::Migration
  def change
    create_table :celebs do |t|
    
      t.string  :name
      t.attachment  :face
      t.attachment  :emblem
      t.string  :hashtag
      t.string  :playlist
      t.integer :view, default: 0
      t.timestamps null: false
    end
  end
end
