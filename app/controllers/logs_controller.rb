class LogsController < ApplicationController

    
  def index
    @logs = Log.all
  end
  
  def current
    unless Log.last.nil?
      @video = Log.last.video
      @message = Log.last.message
    end
  end

  def create
    log = Log.new(log_params)
    if log.save
      redirect_to logs_current_url
    else
      render logs_current_url
    end
  end

  def random
    @log = Log.order("RANDOM()").first
  end

  private
    def log_params
      params.permit(:video, :message)
    end
end