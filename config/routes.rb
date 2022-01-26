Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/taxcalc', to: 'pages#taxcalc'

  post 'goals/:id/archive', to: 'goals#archive', as: :archive_goal
  post 'goals/:id/unarchive', to: 'goals#unarchive', as: :unarchive_goal
  post 'goals/:id/update_goal_extra_saved', to: 'goals#update_goal_extra_saved', as: :update_goal_extra_saved

  resources :goals

  # get "users", to: "users#index"
  # delete "users/:id", to: "users#destroy"

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user

  get 'details', to: "details#index"
end
