class Admin::ActorsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @actors = Actor.all.page(params[:page]).per(20)
    end

    def show
      @actor = Actor.find(params[:id])
    end

    def edit
      @actor = Actor.find(params[:id])
    end

    def update
      @actor = Actor.find(params[:id])
      if @actor.update(actor_params)
        redirect_to admin_actor_path(@actor.id)
      else
        render "edit"
      end
    end

    private

    def actor_params
      params.require(:actor).permit(:name, :email, :image, :born_year, :born_month, :born_day, :age, :body, :career,
      :contact, :stature, :gender, :instagram_rink, :twitter_rink, :tiktok_rink, :others_rink)
    end

end
