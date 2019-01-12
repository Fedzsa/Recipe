class CommentController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def create
        comment = Comment.new(:comment => params['comment'])
        comment.recips << Recip.find(params[:id])
        comment.user = current_user
        comment.save
        redirect_to :controller => 'recipe', :action => 'details', :id => params[:id]
    end

    def edit
        comment = Comment.find(params[:id])
        comment.comment = params['edited-comment']
        comment.save
        redirect_to :controller => 'recipe', :action => 'details', :id => params['recipeid']
    end

    def delete
        Comment.find(params[:id]).destroy
        redirect_to :controller => 'recipe', :action => 'details', :id => params['query']
    end
end
