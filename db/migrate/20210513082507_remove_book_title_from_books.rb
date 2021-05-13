class RemoveBookTitleFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_title, :text
  end
end
