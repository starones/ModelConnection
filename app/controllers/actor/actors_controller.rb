class Actor::ActorsController < ApplicationController

  #更新しても閲覧数がカウントしないように設定したため下記２つ「, unique: [:ip_address]」を消すと閲覧数は上がる
  impressionist :actions => [:show], unique: [:ip_address]

  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true)
  end

  def show
    @actor = Actor.find(params[:id])
    # ----トラッキング機能（1つのIPアドレスで1PVあがる）----
    impressionist(@actor, nil, unique: [:ip_address])
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.update(actor_params)
    redirect_to actor_path(@actor.id)
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :image, :born_year, :born_month, :born_day, :age, :body, :career, :contact, :stature, :gender, :instagram_rink, :twitter_rink, :tiktok_rink, :others_rink)
  end

end
