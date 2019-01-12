class RecipeController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token 

    def details
        @recipe = Recip.find(params[:id])
    end

    def new
    end
    
    def create
        recipe = Recip.new(:name => params['title'], :description => params['description'], :foodtype => params['type'])
        recipe.image = params['picture']

        i = 1
        while params.has_key?("ingredient-#{i}")
            ingredient = Ingredient.new(:name => params["ingredient-#{i}"])
            recipe.ingredients << ingredient
            i+=1
        end

        recipe.user = User.find(current_user.id)

        recipe.save

        redirect_to :controller => 'user', :action => 'index'
    end
    
    def edit
        @recipe = Recip.find(params[:id])
    end

    def modify
        recipe = Recip.find(params[:id])
        recipe.name = params['title']
        recipe.description = params['description']
        recipe.foodtype = params['type']
        ingredients = recipe.ingredients

        i = 1
        j = 0
        while params.has_key?("ingredient-#{i}")
            ingredient = Ingredient.find(ingredients[j].id)
            ingredient.name = params["ingredient-#{i}"]
            ingredient.save
            i+=1
            j+=1
        end

        recipe.user = User.find(current_user.id)

        recipe.save

        redirect_to :controller => 'user', :action => 'index'
	end
	
	def delete
		Recip.find(params[:id]).destroy
		redirect_to :controller => 'user', :action => 'index'
	end
end
