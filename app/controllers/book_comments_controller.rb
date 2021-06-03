class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    # binding.pry　← 一時ここで処理ストップさせてターミナルで挙動確認することが可能。
    @book = Book.find(params[:book_id])
    @comment = BookComment.find_by(id: params[:id], book_id: @book)
    @comment.destroy
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
