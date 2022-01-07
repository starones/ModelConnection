class Actor::ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :image, :born_year, :born_month, :born_day, :age, :body, :career, :cotact, :stature, :gender, :instagram_rink, :twitter_rink, :tiktok_rink, :others_rink)
  end

end
