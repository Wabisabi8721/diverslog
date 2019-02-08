class ToppagesController < ApplicationController
  def index
    if logged_in?
      @log = current_user.logs.build
    end
  end
end
