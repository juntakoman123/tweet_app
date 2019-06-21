class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
      t.string :image_name
      t.string :password_digest
    end
  end
end
