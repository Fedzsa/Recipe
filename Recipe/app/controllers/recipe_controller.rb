class RecipeController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token 

    def details
        @recipe = Recip.find(params[:id])
        puts @recipe.comments
    end

    def new
    end
    
    def create
        recipe = Recip.new(:name => params['title'], :description => params['description'], :foodtype => params['type'])
        
        i = 1
        while params.has_key?("ingredient-#{i}")
            ingredient = Ingredient.new(:name => params["ingredient-#{i}"])
            recipe.ingredients << ingredient
            i+=1
        end

        recipe.user = current_user

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
