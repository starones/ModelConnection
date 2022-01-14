class Actor::HomesController < ApplicationController

  def top
    @ranks = Actor.find(Favorite.group(:actor_id).order('count(actor_id) desc').limit(4).pluck(:actor_id))
    @actors = Actor.order(created_at: :desc).limit(4)
  end

  def about
  end
end
