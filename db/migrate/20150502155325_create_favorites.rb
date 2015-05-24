class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, references: :users
      t.integer :post_id, references: :posts
      t.index :user_id
      t.index :post_id

      t.timestamps
    end
  end
end
