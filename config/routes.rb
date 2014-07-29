Rails.application.routes.draw do
  resources :locations, :users do
      resources :visits
  end
  resources :search, :only => :create
  root 'locations#index' #this is to configure it to go to the page when it is at the route
  get 'home' => 'home#welcome' #when we right /home we want it to go to home conteroller and execute welcome function/action
end
