class CreateFbtokens < ActiveRecord::Migration
  def change
    create_table :fbtokens do |t|
      t.string  :token
      t.string  :page_id
      t.timestamps null: false
    end
  end
end
