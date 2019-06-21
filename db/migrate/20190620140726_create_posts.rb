class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamps
      t.integer :user_id
    end
  end
end
