class User < ActiveRecord::Base
  include FacebookerAuthentication::Model
  
  has_many :items
  has_many :comments
  
  def friends_with_items(friends_facebook_ids)
	  User.find(:all, :conditions=>["users.facebook_id in (?)", friends_facebook_ids])
  end
  
end
