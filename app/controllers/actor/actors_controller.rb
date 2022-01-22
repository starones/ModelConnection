class Actor::ActorsController < ApplicationController
  before_action :authenticate_actor!, except: [:index, :show]
  # 更新しても閲覧数がカウントしないように設定したため下記２つ「, unique: [:ip_address]」を消すと閲覧数は上がる
  impressionist :actions => [:show], unique: [:ip_address]

  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true).page(params[:page]).per(24)
  end

  def show
    @actor = Actor.find(params[:id])
    # ----トラッキング機能（1つのIPアドレスで1PVあがる）----
    impressionist(@actor, nil, unique: [:ip_address])
  end

  def edit
    @actor = Actor.find(params[:id])
    # ------ログインユーザーとidが一致してないとtopに戻すセキュリティー---
    if @actor.id == current_actor.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update(actor_params)
      redirect_to actor_path(@actor.id)
    else
      render "edit"
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :image, :born_year, :born_month, :born_day, :age, :body, :career,
    :contact, :stature, :gender, :instagram_rink, :twitter_rink, :tiktok_rink, :others_rink)
  end
end
