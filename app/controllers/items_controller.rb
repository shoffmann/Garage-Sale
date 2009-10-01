class ItemsController < ApplicationController
  
  before_filter :find_user, :only => [:index, :show, :my_items]
  
  def index
    list_of_friends = (params[:fb_sig_friends]||"").split(/,/)
    @friends_items = Item.find_for_friends(list_of_friends)
  end

  def my_items
    @items = @current_user.items
  end
  

  def new
    @item = Item.new
  end
  
  def create
    @item = @current_user.items.new(params[:item])
    if @item.save
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
    @item.update_attributes(params[:item])
    redirect_to item_path
  end

  def destroy
    @item = @current_user.items.find(params[:id])
    @item.destroy
    redirect_to my_items_items_path
  end
  
end