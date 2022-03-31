class Relationship < ApplicationRecord
  belongs_to :user, foreign_key: "followed_id"
  belongs_to :follower, foreign_key: "follower_id"
  # class_name: "User",
  # class_name: "Follower",

  #データ作成時、followed_idとfollower_idが同じデータは1件のみに限定(一意)
  validates :followed_id, uniqueness: {scope: [:follower_id]}
  #DB側に制約を設定する場合、両カラムにユニークindexを作成する
  #マイグレーションファイル(例)
  # def change
  #   add_index :relationships, [:followed_id, :follower_id], unique: true
  # end

end
