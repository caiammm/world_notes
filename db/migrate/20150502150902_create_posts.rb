class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id, references: :users
      t.index :user_id
      t.string :tags, array: true, default: []
      t.integer :votes



      t.timestamps
    end
  end
end
