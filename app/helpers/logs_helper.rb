module LogsHelper
  def current_log
    @current_log ||= Log.find_by(id: session[:log_id])
  end
  
  def logged_in?
    !!current_user
  end
end
