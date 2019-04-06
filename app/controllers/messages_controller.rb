class MessagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def index
    @log = Log.where(id: current_user.belonged_ids).find_by(id: params[:log_id])
    @messages = @log.messages.order('created_at DESC').page(params[:page])
  end
  
  def new
    @message = Message.new
    @log = Log.where(id: current_user.belonged_ids).find_by(id: params[:log_id])
    #session[:log_id] = @log.id
    @messages = @log.messages.order('created_at DESC').page(params[:page])
    @members = @log.dove_togethers.where.not(id: current_user.id)
  end
  
  def create
    if current_log.in_member(current_user)
      @message = current_log.messages.build(message_params)
      @message.speaker_id = current_user.id
      if @message.save
        flash[:success] = 'メッセージを送信しました。'
        redirect_to new_message_url
      else
        @messages = current_log.messages.order('created_at DESC').page(params[:page])
        flash.now[:danger] = 'メッセージの送信に失敗しました。'
        render 'messages/new'
      end
    else
      redirect_to current_user
    end
  end
  
  def destroy
    @message.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def message_params
    params.require(:message).permit(:speaker_id, :receiver_id, :comment)
  end
  
  def correct_user
    @message = Message.find_by(id: params[:id])
    unless @message
      redirect_to root_url
    end
  end
end
