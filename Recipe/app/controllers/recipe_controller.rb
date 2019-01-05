class RecipeController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token 
       
    def new
    end
    
    def create
        redirect_to :controller => 'user', :action => 'index'
    end
end
