class FavoritesController < ApplicationController
  include Common
  before_action :set_search_window
  
  def create
    book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: book.id)
    if @favorite.save
      #view側にcreateを実行した画面IDの情報を持たせて
      #リクエストパラメータで判定してリダイレクト先を
      #変更する(v_index：booksのindex画面、v_show：booksのshow画面)
      if params[:disp_id] == "v_index"
        redirect_to books_path
      else
        redirect_to book_path(book.id)
      end
    else
      @books = Book.all
      @book = Book.new
      render 'books/index'
    end

    # @favorite = Favorite.new
    # @favorite.user_id = current_user.id
    # @favorite.book_id = params[:book_id]
    # if @favorite.save
    #   redirect_to books_path
    # else
    #   @books = Book.all
    #   @book = Book.new
    #   render 'index'
    # end
  end

  def destroy
    # @favorite = Favorite.find(params[:id])
    book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: book.id)
    @favorite.destroy
    if params[:disp_id] == "v_index"
      redirect_to books_path
    else
      redirect_to book_path(book.id)
    end
  end

  # private

  # def favorite_params
  #   params.require(:favorite).permit(:user_id, :book_id)
  # end

end
