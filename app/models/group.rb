class Group < ApplicationRecord
  has_secure_password

  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true
  attachment :image
end
