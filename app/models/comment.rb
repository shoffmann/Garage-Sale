class Comment < ActiveRecord::Base
  belongs_to :item, :counter_cache => true
  belongs_to :user
end
