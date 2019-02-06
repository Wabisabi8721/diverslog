class LogsController < ApplicationController
  before_action :require_user_logged_in
  # before_action :correct_user, only: [:destroy]
  
  def create
    @log = current_user.logs.build(log_params)
    @logs = Log.where(id: @user.belonged_ids).order('created_at DESC').page(params[:page])
    @log.total_min =  @logs.last + @log.dove_time
    if @log.save
      flash[:success] = 'ログを投稿しました。'
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = 'ログの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @log.destroy
    flash[:success] = 'ログを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def log_params
    params.require(:log).permit(:dove_on, :dove_in_at, :dove_out_at, :dove_time, :total_min, :depth_ave, :depth_max, :location, :creature, 
                                members_attributes: [:id, :log_id, :user_id, :_destroy])
  end
  
  # def correct_user
  #   @log = Log.find_by(id: params[:id])
  #   unless @log
  #     redirect_to root_url
  #   end
  # end
end
