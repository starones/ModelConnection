class Actor::ClientsController < ApplicationController
  
  def index
    @clients = Client.all
  end

end
