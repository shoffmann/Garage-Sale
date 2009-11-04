class InvitationsController < ApplicationController

  def index
    redirect_to items_path
  end
  
  def new
  	if should_update_profile?
  	  update_profile
  	end

    list_of_friends = (params[:fb_sig_friends]||"").split(/,/)
    @not_potential_disciples = current_user.friends_with_items(list_of_friends).map(&:facebook_id)
  end
  
  def should_update_profile?
    params[:from]
  end
  
  def update_profile
  	@user = facebook_session.user
  	@user.profile_fbml = render_to_string(:partial=>"profile", :locals=>{:from=>params[:from]})	  
  end
  
  def create
    @sent_to_ids = params[:ids]
  end
  
end
