class ChangeDataCategoryIdToQueryCodes < ActiveRecord::Migration[6.1]
  def change
    change_column :query_codes, :category_id, :string
    rename_column :query_codes, :category_id, :category_name
  end
end
