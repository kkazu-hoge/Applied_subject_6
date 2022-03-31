class RenameNameColumnToFollowers < ActiveRecord::Migration[6.1]
  def change
    rename_column :followers, :name, :user_name
  end
end
