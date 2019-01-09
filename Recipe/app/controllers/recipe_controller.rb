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

    def addcomment
        comment = Comment.new(:comment => params['comment'])
        comment.recips << Recip.find(params[:id])
        comment.user = current_user
        comment.save
        redirect_to :controller => 'recipe', :action => 'details', :id => params[:id]
    end
end
