class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.item_id = params[:item_id]
    @comment.user_id = params[:user_id]
    
    redirect_to item_path(@comment.item)
  end

  def destroy
    @comment = comments.find(params[:id])
    @comment.destroy
    redirect_to item_path
  end
  
end
