module CommonMdl
  extend ActiveSupport::Concern

  def search_index( header_search_tgt_clf, header_search_clf, search_text )
    # model_name = QueryCode.find_by(category_name: "header_search_tgt_clf", category_param_value: header_search_tgt_clf).category_param_name
    # binding.pry
    if header_search_tgt_clf == '1'
      # binding.pry
      case header_search_clf
      when '1' then #完全一致
        search_result = User.where('name LIKE ?', "#{search_text}")
      when '2' then #前方一致
        search_result = User.where('name LIKE ?', "#{search_text}%")
      when '3' then #後方一致
        search_result = User.where('name LIKE ?', "%#{search_text}")
      when '4' then #部分一致
        # binding.pry
        search_result = User.where('name LIKE ?', "%#{search_text}%")
      end
    elsif header_search_tgt_clf == '2'
      case header_search_clf
      when '1' then #完全一致
        search_result = Book.where('title LIKE ?', "#{search_text}")
      when '2' then #前方一致
        search_result = Book.where('title LIKE ?', "#{search_text}%")
      when '3' then #後方一致
        search_result = Book.where('title LIKE ?', "%#{search_text}")
      when '4' then #部分一致
        search_result = Book.where('title LIKE ?', "%#{search_text}%")
      end
    else
      search_result = nil
    end
    #明示的にreturnする必要はないが可読性のため記載
    # binding.pry
    return search_result
  end

end