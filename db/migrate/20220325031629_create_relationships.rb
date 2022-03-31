class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, presence: true
      t.integer :followed_id, presence: true

      t.timestamps
    end
  end
end
