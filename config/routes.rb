Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  post 'goals/:id/archive', to: 'goals#archive', as: :archive_goal
  post 'goals/:id/unarchive', to: 'goals#unarchive', as: :unarchive_goal

  resources :goals
end
