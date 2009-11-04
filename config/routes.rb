ActionController::Routing::Routes.draw do |map|

  map.connect '', :controller=>"items"
  map.resources :invitations

  #  map.resources :items
  map.resources :items, :collection => {:my_items => :get} do |items|
    items.resources :comments
  end
  
  map.resources :users do |users|
    users.resources :items
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
