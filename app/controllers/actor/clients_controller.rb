class Actor::ClientsController < ApplicationController

  def index
    @clients = Client.all.page(params[:page]).per(24)
  end

end
