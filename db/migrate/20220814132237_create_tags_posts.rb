class CreateTagsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :tags_posts do |t|
      t.references :post, null: false, foreign_key: {to_table: :posts, on_delete: :cascade}
      t.references :tag, null: false, foreign_key: {to_table: :tags, on_delete: :cascade}

      t.timestamps
    end
  end
end
