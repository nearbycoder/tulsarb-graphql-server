class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.belongs_to :user, index: true
      t.integer :votes, null: false, default: 0
      t.timestamps
    end
  end
end
