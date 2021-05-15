class BooksController < ApplicationController

def index
  @books = Book.all
  @book = Book.new
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to use_path(@user)
end

def show
  @book = Book.find(params[:id])
  @book = Book.new
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
  @book.update(book_params)
  redirect_to book_path(@book.id)
end

private
def book_params
  params.require(:book).permit(:title, :body)
end

end
