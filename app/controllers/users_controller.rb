class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  
  def index
    @users = User.all.page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @logs = Log.where(id: @user.belonged_ids).order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

 def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_show_path(@user)
    else
      render :edit
    end
 end
  
  def followings
    @user = User.find(params[:id])
    @logs = Log.where(id: @user.belonged_ids).order('created_at DESC').page(params[:page])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @logs = Log.where(id: @user.belonged_ids).order('created_at DESC').page(params[:page])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  # def friends
  #   @user = User.find(params[:id])
  #   @users = User.all
  #   counts(@user)
  #   @users.each do |user|
  #     if @user.following?(users) && @user.follower?(user)
  #       @friends = User.where(id: user.id).page(params[:page])
  #     end
  #   end
  # end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation, :image, :image_cache)
  end
  
end
