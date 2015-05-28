class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.integer :user_id, references: :users
      t.integer :post_id, references: :posts
      t.index :user_id
      t.index :post_id

      t.timestamps
    end
  end
end
