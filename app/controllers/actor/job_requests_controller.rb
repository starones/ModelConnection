class Actor::JobRequestsController < ApplicationController
  def index
    @job_requests = JobRequest.all.order(created_at: :desc).page(params[:page]).per(8)
  end
end
