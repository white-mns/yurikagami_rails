Rails.application.routes.draw do
  resources :battle_results
  resources :incomes
  resources :item_gets
  resources :new_enemies
  resources :enemy_party_infos
  resources :enemies
  resources :enemy_names
  resources :smiths
  resources :new_places
  resources :current_places
  resources :place_names
  resources :party_infos
  resources :parties
  resources :new_events
  resources :event_proceeds
  resources :events
  resources :learnable_skills
  resources :skills
  resources :skill_data
  resources :items
  resources :job_names
  resources :statuses
  resources :profiles
  resources :proper_names
  resources :names
  get 'top_page/index'
  root 'top_page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
