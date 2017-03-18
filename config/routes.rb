Rails.application.routes.draw do
  resources :animals
  resources :sightings do
    get :get_events, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
