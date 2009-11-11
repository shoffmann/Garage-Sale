class ItemsController < ApplicationController
  
  before_filter :find_user, :only => [:index, :show, :my_items]
  
  def index
    list_of_friends = (params[:fb_sig_friends]||"").split(/,/)
    @friends_items = Item.find_for_friends(list_of_friends)
  end

  def my_items
    @items = @current_user.items.find(:all, :order=>"items.updated_at desc" )
  end
  

  def new
    @item = Item.new
  end
  
  def create
    @item = @current_user.items.new(params[:item])
    if @item.save
      flash[:notice] = "Item added"
      UserPublisher.deliver_profile_update(@current_user) rescue nil
      UserPublisher.register_item
      UserPublisher.deliver_item(@item) rescue nil
      redirect_to my_items_items_path
    else
      render :action => :new 
    end
  end  
  
  def show
    @item = Item.find(params[:id])
  end
    
  def edit
    @item = @current_user.items.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Item updated"
      UserPublisher.deliver_profile_update(@current_user) rescue nil
      UserPublisher.register_item
      UserPublisher.deliver_item(@item) rescue nil
      redirect_to item_path
    else
      render :action => :edit 
    end
  end

  def destroy
    @item = @current_user.items.find(params[:id])
    @item.destroy
    redirect_to my_items_items_path
  end
  
end
