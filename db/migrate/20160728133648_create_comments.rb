class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :comment_upvotes_count, default: 0
      t.integer :comment_downvotes_count, default: 0
      t.references :link, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
