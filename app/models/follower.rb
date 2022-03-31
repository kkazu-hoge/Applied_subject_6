class Follower < ApplicationRecord
  has_many :relationships, foreign_key: "follower_id"
  has_many :users, through: :relationships

  #データ作成時、user_idが重複するデータは作成できない
  validates :user_id, uniqueness: true
  #DB側に設定する際はunique制約を追加する必要がありそう

end
