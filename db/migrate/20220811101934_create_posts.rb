class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
  def down
    drop_table :posts
  end
end
