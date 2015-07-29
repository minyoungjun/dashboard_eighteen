class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|

      t.integer :view
      t.timestamps null: false
    end
  end
end
