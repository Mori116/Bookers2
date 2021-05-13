class AddProfileImageIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :profile_image_id, :string
  end
end

# 追加済