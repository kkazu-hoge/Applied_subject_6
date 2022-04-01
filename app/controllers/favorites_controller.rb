class FavoritesController < ApplicationController
  include Common
  before_action :set_search_window

  def create
    @favorite_book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @favorite_book.id)
    @favorite.save
    # if @favorite.save
      #view側にcreateを実行した画面IDの情報を持たせて
      #リクエストパラメータで判定してリダイレクト先を
      #変更する(v_index：booksのindex画面、v_show：booksのshow画面)

      # if params[:disp_id] == "v_index"
      #   redirect_to books_path
      # else
      #   redirect_to book_path(book.id)
      # end
  #   else
  #     @books = Book.all
  #     @book = Book.new
  #     # render 'books/index'
  #   end
  end

  def destroy
    # @favorite = Favorite.find(params[:id])
    @favorite_book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @favorite_book.id)
    @favorite.destroy
    # if params[:disp_id] == "v_index"
    #   redirect_to books_path
    # else
    #   redirect_to book_path(book.id)
    # end
  end

  # private

  # def favorite_params
  #   params.require(:favorite).permit(:user_id, :book_id)
  # end

end
