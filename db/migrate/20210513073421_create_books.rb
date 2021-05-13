class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.text :body
      t.string :profile_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
