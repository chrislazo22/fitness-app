Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/profile', to: 'workout_plans#profile'
  get '/current_plan', to: 'workout_plans#current_plan'

  resources :workout_plans
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homepage#index'

  namespace :admin do
    resources :dashboard, only: [:index], controller: :dashboard
    resources :workouts do
      collection { post :import }
    end
  end
end
