class Admin::ActorsController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
    
    def index
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
end
