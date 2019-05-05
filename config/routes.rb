Rails.application.routes.draw do
  resources :users, :pets, :foods, :pictures
  get '/dashboard', to: 'dashboard#dashboard'
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
