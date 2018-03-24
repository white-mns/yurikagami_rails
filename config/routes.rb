Rails.application.routes.draw do
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
