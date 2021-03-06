class Actor::ActorsController < ApplicationController
  before_action :authenticate_actor!, except: [:index, :show]
  before_action :set_actor, only: [:show, :edit, :update]
  # 更新しても閲覧数がカウントしないように設定したため下記２つ「, unique: [:ip_address]」を消すと閲覧数は上がる
  impressionist :actions => [:show], unique: [:ip_address]

  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true).page(params[:page]).per(16)
  end

  def show
    # ----トラッキング機能（1つのIPアドレスで1PVあがる）----
    impressionist(@actor, nil, unique: [:ip_address])
  end

  def edit
    # ------ログインユーザーとidが一致してないとtopに戻すセキュリティー---
    if @actor.id == current_actor.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @actor.update(actor_params)
      redirect_to actor_path(@actor.id)
    else
      render "edit"
    end
  end

  # ----------退会機能----------
  def unsubscribe
    @actor = current_actor
  end

  def withdraw
    @actor = current_actor
    @actor.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  # ---------ここまで-----------

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :image, :born_year, :born_month, :born_day, :age, :body, :career,
    :contact, :stature, :gender, :instagram_rink, :twitter_rink, :tiktok_rink, :others_rink, :is_deleted, :string)
  end
end
