Rails.application.routes.draw do
  resources :locations
  resources :cities

  root 'locations#index' #this is to configure it to go to the page when it is at the route
  get 'home' => 'home#welcome' #when we right /home we want it to go to home conteroller and execute welcome function/action
  get 'about' => 'about#contact_info'
  get 'locations' => 'locations#index'

  get 'locations/:id' => 'locations#show' 
  post 'locations/new'=> 'locations#create'

  
  get 'locations/:location_id/visits' => 'visits#index'
  get 'locations/:location_id/visits/:id' => 'visits#show'
end
