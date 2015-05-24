class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, references: :users
      t.index :user_id
      t.integer :post_id, references: :posts
      t.index :post_id
      t.text :content

      t.timestamps
    end
  end
end
