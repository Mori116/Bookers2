class AddBodyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :body, :text
  end
end

# 追加済