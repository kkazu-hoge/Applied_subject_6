class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    #サインアップ、サインイン時に自動的にfolloweレコードを作成する
    unless Follower.exists?(user_id: current_user.id)
      follower = Follower.new(user_id: current_user.id, user_name: current_user.name)
      follower.save
    end
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
