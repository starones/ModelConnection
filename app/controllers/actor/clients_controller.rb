class Actor::ClientsController < ApplicationController
  def index
    @clients = Client.all.page(params[:page]).per(16)
  end
end
