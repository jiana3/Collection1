class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :concents
      t.string :user
      t.datetime :published

      t.timestamps null: false
    end
  end
end
