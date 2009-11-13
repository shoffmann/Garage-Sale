class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :title, :price
  
  def self.find_for_friends(friends_facebook_ids)
    Item.find(:all,
              :conditions=>["users.facebook_id in (?)",friends_facebook_ids],
              :include=>[:user],
              :order=>"items.updated_at desc" )
  end
  
  def has_comments?
    !comments.nil?
  end

  def has_photos?
    !photos.nil?
  end

  def updated?
    updated_at > created_at
  end
  
  def item_display_time()
    if updated?
      time = "at " + updated_at.strftime('%l:%M %p') + " on " + updated_at.strftime('%B %d, %Y')
    else 
      time = "at " + created_at.strftime('%l:%M %p') + " on " + created_at.strftime('%B %d, %Y')
    end
    return time
  end
  
end
