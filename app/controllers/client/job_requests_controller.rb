class Client::JobRequestsController < ApplicationController
  before_action :authenticate_client!, except: [:show]
  before_action :set_jobrequest, only: [:show, :edit, :update, :destroy]

  def index
    @job_requests = current_client.job_requests.page(params[:page])
  end

  def show
  end

  def edit
    if @job_request.client.id == current_client.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def new
    @job_request = JobRequest.new
  end

  def create
    @job_request = JobRequest.new(job_request_params)
    @job_request.client_id = current_client.id
    if @job_request.save
      redirect_to client_job_requests_path
    else
      render "new"
    end
  end

  def update
    if @job_request.update(job_request_params)
      redirect_to client_job_request_path(@job_request)
    else
      render "edit"
    end
  end

  def destroy
    @job_request.destroy
    redirect_to client_job_requests_path
  end

  private

  def set_jobrequest
    @job_request = JobRequest.find(params[:id])
  end

  def job_request_params
    params.require(:job_request).permit(:title, :job_content, :recruitment_gender,
    :recruitment_stature, :recruitmebt_other, :money, :contact)
  end
end
