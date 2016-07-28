class CreateUpVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
