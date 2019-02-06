class ToppagesController < ApplicationController
  def index
    if logged_in?
      @log = current_user.logs.build
      @total_min = Log.where(id: current_user.belonged_ids).last.total_min
    end
  end
end
