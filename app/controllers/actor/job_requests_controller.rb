class Actor::JobRequestsController < ApplicationController

  def index
    @job_requests = JobRequest.all
  end

  def show
  end
end
