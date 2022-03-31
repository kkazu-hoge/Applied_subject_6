class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :user_id, presence: true
      t.string :name, presence: true

      t.timestamps
    end
  end
end
