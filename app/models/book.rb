class Book < ApplicationRecord

belongs_to :user
attachment :image

end
