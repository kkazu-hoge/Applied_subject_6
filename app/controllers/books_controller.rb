class BooksController < ApplicationController
  include Common
  before_action :set_search_window
  before_action :verifi_datauser_loginuser_mdlbook, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_r = Book.new
    # @book_comments = Book.book_comments
    @book_comment = BookComment.new
  end

  def search
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def verifi_datauser_loginuser_mdlbook
    unless current_user.id.to_s == Book.find_by(id: params[:id]).user_id.to_s
      redirect_to books_path
    end
  end

end
