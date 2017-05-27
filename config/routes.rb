Rails.application.routes.draw do
  resources :workout_plans
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homepage#index'

  namespace :admin do
    resources :dashboard, only: [:index], controller: :dashboard
    resources :workouts, only: [:index]
  end
end
