Rails.application.routes.draw do
  resources :new_places
  resources :new_events
  resources :event_proceeds
  resources :events
  get "current_place/start",  :to => "current_places#start_graph",  :as => "current_places_start"
  resources :current_places
  resources :party_infos
  resources :parties
  resources :learnable_skills
  resources :skills
  resources :skill_data
  resources :items
  get "status/graphs",  :to => "statuses#graph",  :as => "status_graphs"
  resources :statuses
  resources :profiles
  resources :names
  resources :proper_names
  resources :uploaded_checks
  get 'top_page/privacy'
  root 'top_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
