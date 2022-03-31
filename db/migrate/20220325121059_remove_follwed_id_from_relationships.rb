class RemoveFollwedIdFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :followed_id, :integer
    remove_column :relationships, :follower_id, :integer
  end
end
