Rails.application.routes.draw do
  root to: 'snowballs#index'

  resources :transactions
  resources :accounts
  resources :snowballs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
