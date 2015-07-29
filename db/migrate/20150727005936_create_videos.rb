class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|

      t.integer  :celeb_id
      t.string  :title
      t.text  :description
      t.string  :thumbnail
      t.integer :view, default:0
      t.timestamps null: false
    end
  end
end
