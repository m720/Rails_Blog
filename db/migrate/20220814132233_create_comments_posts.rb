class CreateCommentsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :comments_posts do |t|
      t.references :comment, null: false, foreign_key: {to_table: :comments}
      t.references :post, null: false, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
