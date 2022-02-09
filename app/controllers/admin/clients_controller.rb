class Admin::ClientsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @clients = Client.all.page(params[:page]).per(20)
    end

    def show
      @client = Client.find(params[:id])
    end

    def edit
      @client = Client.find(params[:id])
    end

    def update
      @client = Client.find(params[:id])
      if @client.update(client_params)
        redirect_to admin_client_path(@client.id)
      else
        render "edit"
      end
    end

    private

    def client_params
      params.require(:client).permit(:name, :email, :image, :body, :contact, :is_deleted)
    end

end
