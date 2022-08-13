class CreateComments < ActiveRecord::Migration[7.0]
  def up
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :body
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
