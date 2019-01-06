class RecipeController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token 

    def details
        @recipe = Recip.find(params[:id])
    end

    def new
    end
    
    def create
        recipe = Recip.new(:name => params['title'], :description => params['description'], :user_id => current_user.id)
        
        i = 1
        while params.has_key?("ingredient-#{i}")
            ingredient = Ingredient.new(:name => params["ingredient-#{i}"])
            recipe.ingredients << ingredient
            i+=1
        end

        recipe.save

        redirect_to :controller => 'user', :action => 'index'
    end
end
