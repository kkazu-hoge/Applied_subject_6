class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :book_id, presence:true
      t.integer :user_id, presence:true

      t.timestamps
    end
  end
end
