class QueryCode < ApplicationRecord

#検索時に検索条件を使いまわせるようscopeを設定
#QueryCodeモデルを経由してcategory_nameが'header_search_clf'の区分名と区分値を２次元配列として取得する条件
scope :search_window_sc, ->{where(category_name: 'header_search_clf').map{ |sc| [sc.category_param_name, sc.category_param_value]}}
#QueryCodeモデルを経由してcategory_nameが'header_search_tgt_clf'の区分名と区分値を２次元配列として取得する条件
scope :search_window_stc, ->{where(category_name: 'header_search_tgt_clf').map{ |stc| [stc.category_param_name, stc.category_param_value]}}

end
