class Actor::HomesController < ApplicationController
  def top
    # ---トラッキング機能で閲覧数の多い順---
    @ranks = Actor.order(impressions_count: 'DESC').limit(4)
    # -------新規作成順--------
    @actors = Actor.order(created_at: :desc).limit(4)
  end

  def about
  end
  
  def login
  end
end
