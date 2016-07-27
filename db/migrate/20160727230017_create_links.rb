class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.integer :votes_count

      t.timestamps
    end
  end
end
