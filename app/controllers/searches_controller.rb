class SearchesController < ApplicationController
  include Common
  before_action :set_search_window

  include CommonMdl

  def search
    #検索区分を定義(検索処理の分岐に使用)
    f_header_search_clf = params[:header_search_clf]
    #検索対象区分を格納(検索ウインドウのインスタンス変数と被らないように「f_」を先頭に記載)
    @f_header_search_tgt_clf = params[:header_search_tgt_clf]
    #検索キーワードを格納
    @f_search_text = params[:search_text]
    #検索結果をobjに格納
    # binding.pry
    @f_result_obj = search_index(@f_header_search_tgt_clf, f_header_search_clf, @f_search_text)
    # binding.pry
  end

end
