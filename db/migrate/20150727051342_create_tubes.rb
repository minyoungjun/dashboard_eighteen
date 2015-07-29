class CreateTubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|

      t.timestamps null: false
    end
  end
end
