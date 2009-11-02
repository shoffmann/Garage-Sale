class UserPublisher < Facebooker::Rails::Publisher

  def item_template
    one_line_story_template "{*actor*} added {*new_item*} to {*userlink*}."
    one_line_story_template "{*actor*} added items to Garage Sale"
    short_story_template "{*actor*} added {*new_item*} to {*userlink*}.", render(:partial=>"short_body")
  end
  
  def item(item)
    send_as :user_action
    from item.user.facebook_session.user
    data  :new_item => link_to(item.title, item_url(item)),
          :item_desc => item.description,
          :userlink => link_to("Garage Sale", items_url(item.user)),
          :applink => link_to("Garage Sale", items_path)
  end

  def profile_update(user)
    send_as :profile
    recipients user
    profile render(:partial=>"users/profile_boxes", 
                   :assigns=>{:user=>user})
    profile_main render(:partial=>"users/profile", 
                        :assigns=>{:user=>user})
  end
    
end
