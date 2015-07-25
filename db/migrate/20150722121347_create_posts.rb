class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :from
      t.string :to
      t.integer :way
      t.string :price

      t.timestamps
    end
  end
end
