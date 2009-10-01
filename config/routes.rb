ActionController::Routing::Routes.draw do |map|

  map.connect '', :controller=>"items"

  #  map.resources :items
  map.resources :items, :collection => {:my_items => :get} do |items|
    items.resources :comments
  end

  # Added custom post action (swfupload) to the photo resource
  map.resources :photos
  map.root :controller => "photos"
  
  map.resources :users do |users|
    users.resources :items
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
