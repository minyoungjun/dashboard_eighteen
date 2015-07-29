class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|

      t.attachment :thumbnail
      t.integer  :celeb_id
      t.string  :title
      t.text  :description
      t.integer :view, default:0
      t.timestamps null: false
    end
  end
end
