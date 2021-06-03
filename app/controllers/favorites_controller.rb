class FavoritesController < ApplicationController

def create
  @book = Book.find(params[:book_id])
  @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
end

def destroy
  @book = Book.find(params[:book_id])
  @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id).destroy
end

end
