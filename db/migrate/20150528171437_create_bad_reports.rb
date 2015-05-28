class CreateBadReports < ActiveRecord::Migration
  def change
    create_table :bad_reports do |t|

      t.integer :user_id, references: :users
      t.integer :post_id, references: :posts
      t.index :user_id
      t.index :post_id

      t.string :reason
      t.boolean :abusive
      t.boolean :bad_language
      t.boolean :spam

      t.timestamps
    end
  end
end
