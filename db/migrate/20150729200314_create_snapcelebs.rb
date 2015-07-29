class CreateSnapcelebs < ActiveRecord::Migration
  def change
    create_table :snapcelebs do |t|
      t.integer :snap_id
      t.integer :celeb_id
      t.integer :view
      t.timestamps null: false
    end
  end
end
