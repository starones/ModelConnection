class Client::ClientsController < ApplicationController

  before_action :authenticate_client!,except: [:show]

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
    # ------ログインユーザーとidが一致してないとtopに戻すセキュリティー---
    if @client.id == current_client.id
    render "edit"
   else
    redirect_to root_path
   end
  end

  def update
    @client = Client.find(params[:id])
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

  private
  def client_params
    params.require(:client).permit(:name, :image, :body, :contact)
  end
end
