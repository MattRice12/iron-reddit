class CreateCommentDownvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_downvotes do |t|
      t.references :user, foreign_key: true
      t.references :comments, foreign_key: true

      t.timestamps
    end
  end
end
