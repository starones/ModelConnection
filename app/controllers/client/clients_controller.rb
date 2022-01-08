class Client::ClientsController < ApplicationController

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to client_client_path(@client.id)
  end

  private
  def client_params
    params.require(:client).permit(:name, :image, :body, :contact)
  end
end
