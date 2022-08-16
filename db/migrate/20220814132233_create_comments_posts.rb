class CreateCommentsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :comments_posts do |t|
      t.references :comment, null: false, foreign_key: {to_table: :comments, on_delete: :cascade}
      t.references :post, null: false, foreign_key: {to_table: :posts, on_delete: :cascade}

      t.timestamps
    end
  end
end
