class Actor::HomesController < ApplicationController

  def top
    @actors = Actor.order(created_at: :desc).limit(4)
  end

  def about
  end
end
