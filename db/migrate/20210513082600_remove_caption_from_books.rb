class RemoveCaptionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :caption, :text
  end
end
