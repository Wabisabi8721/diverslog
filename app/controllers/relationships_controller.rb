class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    user = User.find(params[:friend_id])
    current_user.follow(user)
    flash[:success] = 'ユーザと友達になりました。'
    redirect_back(fallback_location: user)
  end

  def destroy
    user = User.find(params[:friend_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザと友達を解除しました。'
    redirect_back(fallback_location: user)
  end
end
