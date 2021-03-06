class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.item_id = params[:item_id]
    @comment.user_id = current_user
    @comment.save
#    UserPublisher.deliver_item_comment(@comment.item, @comment.user) rescue nil
    redirect_to item_path(@comment.item)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path
  end
  
end
