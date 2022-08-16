class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :user, null: false, foreign_key: {to_table: :users , on_delete: :cascade}
      t.timestamps
    end
  end
end
