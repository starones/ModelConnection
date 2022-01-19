class Actor::JobRequestsController < ApplicationController

  def index
    @job_requests = JobRequest.all.order(created_at: :desc).page(params[:page]).per(14)
  end

  def show
  end
end
