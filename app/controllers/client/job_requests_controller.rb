class Client::JobRequestsController < ApplicationController

  def index
    @job_requests = current_client.job_requests.page(params[:page])
  end

  def show
    @job_request = JobRequest.find(params[:id])
  end

  def edit
    @job_request = JobRequest.find(params[:id])
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
    @job_request = JobRequest.find(params[:id])
    @job_request.update(job_request_params)
    redirect_to client_job_request_path(@job_request)
  end

  def destroy
    @job_request = JobRequest.find(params[:id])
    @job_request.destroy
    redirect_to client_job_requests_path
  end

  private
  def job_request_params
    params.require(:job_request).permit(:title, :job_content, :recruitment_gender, :recruitment_stature, :recruitmebt_other, :money, :contact)
  end
end
