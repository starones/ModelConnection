class Actor::JobRequestsController < ApplicationController

  def index
    @job_requests = JobRequest.all.order(created_at: :desc)
  end

  def show
  end
end
