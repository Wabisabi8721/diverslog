class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include LogsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_logs = @logs.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    # if current_user.followings.include?(user) && current_user.followers.include?(user)
    #   @count_friends = user.followers.count
    # end
  end
end
