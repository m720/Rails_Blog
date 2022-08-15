class CreateTagsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :tags_posts do |t|
      t.references :post, null: false, foreign_key: {to_table: :posts}
      t.references :tag, null: false, foreign_key: {to_table: :tags}

      t.timestamps
    end
  end
end
