class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :description
      t.integer :likes, default: 0
      t.references :newsletter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
