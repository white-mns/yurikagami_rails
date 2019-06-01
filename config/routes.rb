Rails.application.routes.draw do
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
