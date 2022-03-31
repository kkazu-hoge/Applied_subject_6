class RelationshipsController < ApplicationController
  include Common
  before_action :set_search_window

  def create
    # binding.pry
    user = User.find(params[:follower_id]) #current_user
    followed_user = User.find(params[:user_id])
    #followersテーブルにcurrent_userのfollowerとしてのデータがなければ
    #followersテーブルに新規登録する
    unless Follower.exists?(user_id: user.id)
      follower = Follower.new(user_id: user.id, user_name: user.name)
      follower.save
    end

    #followed_userのfollowerグループにfollower_userを追加する
    follower_user = Follower.find_by(user_id: user.id)
    if followed_user.followers << follower_user
    #request.refererで遷移前のURLを保持している
      redirect_to request.referer
    else
      @users = User.all
      @book = Book.new
      render 'users/index'
    end
  end

  def destroy
    # binding.pry
    relationship = Relationship.find(params[:id])
    relationship.destroy
    redirect_to request.referer
  end

  def follow_index
    #
    if Follower.exists?(user_id: params[:user_id])
      @follows = Follower.find_by(user_id: params[:user_id]).users
    else
      @follows = ""
    end
  end

  def follower_index
    #userは必ず存在するのでレコードありなしの判定は不要
    @followers = User.find(params[:user_id]).followers
  end

end
