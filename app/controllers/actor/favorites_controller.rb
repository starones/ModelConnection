class Actor::FavoritesController < ApplicationController

  def create
    @actor = Actor.find(params[:actor_id])
    favorite = current_client.favorites.new(actor_id: @actor.id)
    favorite.save
  end

  def destroy
    @actor = Actor.find(params[:actor_id])
    favorite = current_client.favorites.find_by(actor_id: @actor.id)
    favorite.destroy
  end
end
