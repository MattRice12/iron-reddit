class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.integer :upvotes_count, default: 0
      t.integer :downvotes_count, default: 0

      t.timestamps
    end
  end
end
