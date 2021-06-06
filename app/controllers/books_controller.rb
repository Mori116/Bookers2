class BooksController < ApplicationController

def index
  @books = Book.includes(:favorites).sort {|a,b| b.favorites.count <=> a.favorites.count}
  # @books = Book.allの意。かつ、いいね数の多い順に並べ替え（sortメソッド）可能にする。
  @book = Book.new
  @user = current_user
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    flash[:notice] = 'You have created book successfully.'
    redirect_to book_path(@book)
  else
    @books = Book.all
    @user = current_user
    render  :index
  end
end

def show
  @book_new = Book.new
  @book = Book.find(params[:id])
  @user = @book.user
  @book_comment = BookComment.new
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

def edit
  @book = Book.find(params[:id])
  if @book.user != current_user
    redirect_to books_path
  end
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :edit
  end
end

private
def book_params
  params.require(:book).permit(:title, :body)
end

end
