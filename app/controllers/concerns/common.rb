module Common
extend ActiveSupport::Concern

  def set_search_window
    @header_search_clf = QueryCode.search_window_sc
    @header_search_tgt_clf = QueryCode.search_window_stc
  end

end