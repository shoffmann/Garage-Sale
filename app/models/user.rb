class User < ActiveRecord::Base
  include FacebookerAuthentication::Model
  
  has_many :items
  has_many :comments
end
