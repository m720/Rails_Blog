class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tile

      t.timestamps
    end
  end
  def down
    drop_table :tags
  end
end
