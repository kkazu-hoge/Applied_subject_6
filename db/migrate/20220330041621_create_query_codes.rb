class CreateQueryCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :query_codes do |t|
      t.integer :category_id, null: false
      t.string :category_param_name, null: false
      t.integer :category_param_value, null: false

      t.timestamps
    end
  end
end
