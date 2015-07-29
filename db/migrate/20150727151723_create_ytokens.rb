class CreateYtokens < ActiveRecord::Migration
  def change
    create_table :ytokens do |t|
      t.string  :token
      t.timestamps null: false
    end
  end
end
