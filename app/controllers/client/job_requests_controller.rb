class Client::JobRequestsController < ApplicationController

  def index

  end

  def show
  end

  def edit
  end

  def new
    @job_request = JobRequest.new
  end

  def create
    @job_request = JobRequest.new(job_request_params)
    @job_request.client_id = current_client.id
    @job_request.save
    redirect_to client_job_requests_path
  end

  def update
  end

  def destroy
  end

  private
  def job_request_params
    params.require(:job_request).permit(:title, :job_content, :recruitment_gender, :recruitment_stature, :recruitmebt_other, :money, :contact)
  end
end
