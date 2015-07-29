class CreateFbvideos < ActiveRecord::Migration
  def change
    create_table :fbvideos do |t|

      t.timestamps null: false
    end
  end
end
