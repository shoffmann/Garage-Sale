class InvitationsController < ApplicationController

  def index
    redirect_to items_path
  end
  
  def new
    list_of_friends = (params[:fb_sig_friends]||"").split(/,/)
    @not_potential_disciples = current_user.friends_with_items(list_of_friends).map(&:facebook_id)
  end
  
  def create
    @sent_to_ids = params[:ids]
  end
  
end
