class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :title
  
  def self.find_for_friends(friends_facebook_ids)
    Item.find(:all,
              :conditions=>["users.facebook_id in (?)",friends_facebook_ids],
              :include=>[:user],
              :limit=>20 )
  end
  
  def has_comments?
    !comments.nil?
  end

  def has_photos?
    !photos.nil?
  end

end
