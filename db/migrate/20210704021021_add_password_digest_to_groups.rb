class AddPasswordDigestToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :password_digest, :string
  end
end
