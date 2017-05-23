Rails.application.routes.draw do
  resources :workout_plans
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homepage#index'
end
