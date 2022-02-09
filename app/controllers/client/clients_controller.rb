class Client::ClientsController < ApplicationController
  before_action :authenticate_client!, except: [:show]
  before_action :set_client, only: [:show, :edit, :update]

  def show
    # viwes/client/job_request/の依頼者:の所で使用
    @job_request = @client.job_requests
  end

  def edit
    # ------ログインユーザーとidが一致してないとtopに戻すセキュリティー---
    if @client.id == current_client.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_client_path(@client.id)
    else
      render "edit"
    end
  end

  def favorites
    favorites = Favorite.where(client_id: current_client.id).pluck(:actor_id)
    @favorite_list = Actor.find(favorites)
  end
  
  #------- 退会機能------
  def unsubscribe
    @cient = current_client
  end

  def withdraw
    @client = current_client
    @client.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  # ------ここまで-------

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :image, :body, :contact, :is_deleted)
  end
end
