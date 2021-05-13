class AddTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :text
  end
end

# 追加済