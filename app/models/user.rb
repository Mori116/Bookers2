class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_many :book_comments, dependent: :destroy
has_many :favorites,  dependent: :destroy
# いいね、コメント機能

attachment :profile_image
validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
validates :introduction, length: { maximum: 50 }

has_many :messages, dependent: :destroy
has_many :entries, dependent: :destroy
# DM機能

has_many :group_users
has_many :groups, through: :group_users
# グループ機能

has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :followers, through: :reverse_of_relationships, source: :follower
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followings, through: :relationships, source: :followed
# フォロー/フォロワー機能

def follow(user_id)
  relationships.create(followed_id: user_id)
end

def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
end

def following?(user)
  followings.include?(user)
end

end
