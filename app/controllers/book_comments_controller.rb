class BookCommentsController < ApplicationController
  include Common
  before_action :set_search_window
  
  def create
    @book_comment = BookComment.new(book_comment_params)
    # binding.pry
    @book_comment[:book_id] = params[:book_id]
    @book_comment[:user_id] = current_user.id
    # @book_commnet.user_id = current_user.id
    if @book_comment.save
      redirect_to book_path(@book_comment.book_id)
    else
      @book = Book.find(params[:book_id])
      @user = @book_comment.user
      @book_r = Book.new
      render "books/show"
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
